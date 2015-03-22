//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "AdvancedTableSearchViewController.h"
#import "AdvancedTableResultsViewController.h"
#import "DetailViewController.h"

//----------------------------------------------------------------------------//

@interface AdvancedTableSearchViewController () <AdvancedTableResultsViewControllerDelegate>

@property (strong, nonatomic) TableResultsViewController *resultsViewController;
@property (strong, nonatomic) UISearchController *searchController;

@property (strong, nonatomic) NSString *selectedDataItem;

@end

//----------------------------------------------------------------------------//

static NSString *CellIdentifier = @"Search Cell";
static NSString *DetailSegueIdentifier = @"Data Detail";

//----------------------------------------------------------------------------//

@implementation AdvancedTableSearchViewController

- (BOOL)definesPresentationContext
{
    return YES;
}

- (TableResultsViewController *)resultsViewController
{
    if (!_resultsViewController) {
        AdvancedTableResultsViewController *resultsVC = [[AdvancedTableResultsViewController alloc] init];
        resultsVC.data = self.data;
        resultsVC.delegate = self;

        self.resultsViewController = resultsVC;
    }
    
    return _resultsViewController;
}

- (UISearchController *)searchController
{
    if (!_searchController) {
        TableResultsViewController *resultsVC = self.resultsViewController;
        UISearchController *searchVC = [[UISearchController alloc] initWithSearchResultsController:resultsVC];
        searchVC.searchResultsUpdater = resultsVC;

        self.searchController = searchVC;
    }
    
    return _searchController;
}

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Slightly different approach as a way to clean up `viewDidLoad`. Search
    // controller (and results controller) are lazily initalized.
    UISearchBar *searchBar = self.searchController.searchBar;
    [searchBar sizeToFit];
    
    self.tableView.tableHeaderView = searchBar;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:DetailSegueIdentifier]) {
        
        DetailViewController *detailVC = segue.destinationViewController;
        
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForCell:sender];
            self.selectedDataItem = self.data[selectedIndexPath.row];
        }
        
        detailVC.dataItem = self.selectedDataItem;
        self.selectedDataItem = nil;
    }
}

#pragma mark - Advanced Table Results Delegate

- (void)resultsController:(AdvancedTableResultsViewController *)resultsController didSelectDataItem:(id)item
{
    self.selectedDataItem = item;
    [self performSegueWithIdentifier:DetailSegueIdentifier sender:resultsController];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

@end
