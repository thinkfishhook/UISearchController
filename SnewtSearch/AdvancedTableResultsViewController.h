//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "TableResultsViewController.h"

@protocol AdvancedTableResultsViewControllerDelegate;

@interface AdvancedTableResultsViewController : TableResultsViewController

@property (weak, nonatomic) id<AdvancedTableResultsViewControllerDelegate> delegate;

@end

//----------------------------------------------------------------------------//

@protocol AdvancedTableResultsViewControllerDelegate <NSObject>

- (void)resultsController:(AdvancedTableResultsViewController *)resultsController didSelectDataItem:(id)item;

@end