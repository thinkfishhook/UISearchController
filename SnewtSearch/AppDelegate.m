//
//  Copyright (c) 2015 Fish Hook LLC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *data = @[ @"Red", @"Blue", @"Yellow", @"Green", @"Purple", @"Orange" ];
    
    UITabBarController *tabBarController = (id)self.window.rootViewController;
    
    for (UINavigationController *navigationController in tabBarController.viewControllers) {
        if ([navigationController.topViewController respondsToSelector:@selector(setData:)]) {
            
            [navigationController.topViewController setValue:data forKey:@"data"];
        }
    }
    
    return YES;
}

@end
