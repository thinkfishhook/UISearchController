//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "ResultsViewController.h"

//----------------------------------------------------------------------------//

@interface ResultsViewController ()

@property (nonatomic, weak)UIView *colorBlock;

@end

//----------------------------------------------------------------------------//

@implementation ResultsViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIView *colorBlock = [[UIView alloc]init];
    colorBlock.translatesAutoresizingMaskIntoConstraints = NO;
    colorBlock.backgroundColor = [UIColor blackColor];
    
    self.colorBlock = colorBlock;
    
    [self.view addSubview:colorBlock];
    
    NSDictionary *nameMap = @{ @"colorBlock" : colorBlock };
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[colorBlock]-30-|" options:0 metrics:nil views:nameMap];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[colorBlock]-200-|" options:0 metrics:nil views:nameMap];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    
    if ([searchString isEqualToString:@"green"]) {
        self.colorBlock.backgroundColor = [UIColor greenColor];
    }
    else {
        self.colorBlock.backgroundColor = [UIColor blackColor];
    }
}

@end
