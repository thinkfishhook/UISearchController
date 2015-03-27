//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "SearchAndResultsTableViewController.h"
#import "DetailViewController.h"

//----------------------------------------------------------------------------//

@interface SearchAndResultsTableViewController () <UISearchBarDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *results;

@end

//----------------------------------------------------------------------------//

static NSString * const CellIdentifier = @"Search Cell";
static NSString * const DetailSegue = @"Detail Segue";

//----------------------------------------------------------------------------//

@implementation SearchAndResultsTableViewController

- (BOOL)definesPresentationContext
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = NO;
    
    self.searchController = searchController;
    
    UISearchBar *searchBar = searchController.searchBar;
    [searchBar sizeToFit];
    
    self.tableView.tableHeaderView = searchBar;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:DetailSegue]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSString *dataItem;
        if (self.searchController.isActive) {
            dataItem = self.results[indexPath.row];
        }
        else {
            dataItem = self.data[indexPath.row];
        }
        
        [segue.destinationViewController setDataItem:dataItem];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.isActive) {
        return self.results.count;
    }
    else {
        return self.data.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *data;
    if (self.searchController.isActive) {
        data = self.results[indexPath.row];
    }
    else {
        data = self.data[indexPath.row];
    }
    
    cell.textLabel.text = data;
    
    return cell;
}

#pragma mark - Search Results Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchController.searchBar.text];
    self.results = [self.data filteredArrayUsingPredicate:searchPredicate];
    
    [self.tableView reloadData];
}

@end
