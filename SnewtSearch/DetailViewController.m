//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "DetailViewController.h"

//----------------------------------------------------------------------------//

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dataItemLabel;

@end

//----------------------------------------------------------------------------//

@implementation DetailViewController

- (void)setDataItem:(NSString *)dataItem
{
    _dataItem = dataItem;
    
    if (self.isViewLoaded) {
        self.dataItemLabel.text = dataItem;
    }
}

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataItemLabel.text = self.dataItem;
}

@end
