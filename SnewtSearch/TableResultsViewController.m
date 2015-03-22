//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "TableResultsViewController.h"
#import "TableResultsViewController+Private.h"

//----------------------------------------------------------------------------//

@interface TableResultsViewController ()

@property (strong, nonatomic) NSArray *results;

@end

//----------------------------------------------------------------------------//

static NSString * CellIdentifier = @"Results Cell";

//----------------------------------------------------------------------------//

@implementation TableResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.results[indexPath.row];
    
    return cell;
}

#pragma mark - Search Controller Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if (searchController.searchBar.text.length > 0) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchController.searchBar.text];
        self.results = [self.data filteredArrayUsingPredicate:searchPredicate];
        [self.tableView reloadData];
    }
}

#pragma mark - Private Helpers

- (id)dataItemForIndexPath:(NSIndexPath *)indexPath
{
    return self.results[indexPath.row];
}

@end
