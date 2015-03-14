//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "ViewController.h"
#import "ResultsViewController.h"

//----------------------------------------------------------------------------//

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

//----------------------------------------------------------------------------//

@implementation ViewController

- (BOOL)definesPresentationContext
{
    return YES;
}

#pragma mark - Interface Builder Actions

- (IBAction)showSearch:(id)sender
{
    ResultsViewController *resultsVC = [[ResultsViewController alloc] init];
    
    UISearchController *searchVC = [[UISearchController alloc] initWithSearchResultsController:resultsVC];
    searchVC.searchResultsUpdater = resultsVC;
    
    [self presentViewController:searchVC animated:YES completion:nil];
}

@end
