//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "TableSearchViewController.h"
#import "TableResultsViewController.h"

//----------------------------------------------------------------------------//

@interface TableSearchViewController ()

@property (strong, nonatomic) TableResultsViewController *resultsViewController;
@property (strong, nonatomic) UISearchController *searchController;

@end

//----------------------------------------------------------------------------//

static NSString * CellIdentifier = @"Search Cell";

//----------------------------------------------------------------------------//

@implementation TableSearchViewController

- (BOOL)definesPresentationContext
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TableResultsViewController *resultsVC = [[TableResultsViewController alloc] init];
    resultsVC.data = self.data;
    
    UISearchController *searchVC = [[UISearchController alloc] initWithSearchResultsController:resultsVC];
    searchVC.searchResultsUpdater = resultsVC;
    
    // Must call `sizeToFit` on the search bar before adding it to the table
    // view's header view or else it shows with a frame of CGRectZero
    [searchVC.searchBar sizeToFit];
    
    self.tableView.tableHeaderView = searchVC.searchBar;
    
    self.resultsViewController = resultsVC;
    self.searchController = searchVC;
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
