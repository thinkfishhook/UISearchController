//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "NavItemSearchViewController.h"
#import "ResultsViewController.h"

//----------------------------------------------------------------------------//

@interface NavItemSearchViewController ()

@property(nonatomic, strong) UISearchController *searchController;
@property(nonatomic, strong) ResultsViewController *resultsViewController;

@end

//----------------------------------------------------------------------------//

@implementation NavItemSearchViewController

- (BOOL)definesPresentationContext
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ResultsViewController *resultsVC = [[ResultsViewController alloc] init];
    
    UISearchController *searchVC = [[UISearchController alloc] initWithSearchResultsController:resultsVC];
    searchVC.searchResultsUpdater = resultsVC;
    
    // Hiding the navigation bar during search (the default behavior) causes the
    // search bar to hide
    searchVC.hidesNavigationBarDuringPresentation = NO;
    
    // Configure search bar to have higher contrast in navigation bar
    searchVC.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    // Pull search bar off of search controller, and stick it into this view
    // controller's navigation item
    self.navigationItem.titleView = searchVC.searchBar;
    
    self.resultsViewController = resultsVC;
    self.searchController = searchVC;
}

@end
