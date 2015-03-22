//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "TableSearchViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBarController *tabBarController = (id)self.window.rootViewController;
    
    TableSearchViewController *tableSearchViewController;
    for (UINavigationController *navigationController in tabBarController.viewControllers) {
        if ([navigationController.topViewController respondsToSelector:@selector(setData:)]) {
            tableSearchViewController = (id)navigationController.topViewController;
        }
    }
    
    NSArray *data = @[ @"Red", @"Blue", @"Yellow", @"Green", @"Purple", @"Orange" ];
    [tableSearchViewController setData:data];
    
    return YES;
}

@end
