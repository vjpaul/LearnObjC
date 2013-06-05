//
//  LOCAppDelegate.m
//  LearnObjC
//
//  Created by Gert-Jan on 6/4/13.
//  Copyright (c) 2013 Gert-Jan. All rights reserved.
//

#import "LOCAppDelegate.h"

@implementation LOCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    self.mainViewController = [[LOCMainViewController alloc] init];
    self.navigationViewController = [[LOCNavigationViewController alloc] initWithRootViewController:self.mainViewController];
    
    self.window.rootViewController = self.navigationViewController;

    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
