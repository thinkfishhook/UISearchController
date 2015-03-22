//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "AdvancedTableResultsViewController.h"
#import "TableResultsViewController+Private.h"

//----------------------------------------------------------------------------//

@interface AdvancedTableResultsViewController ()

@end

//----------------------------------------------------------------------------//

@implementation AdvancedTableResultsViewController

#pragma mark - Table View Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate resultsController:self didSelectDataItem:[self dataItemForIndexPath:indexPath]];
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
}

@end
