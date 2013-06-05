//
//  LOCAppDelegate.h
//  LearnObjC
//
//  Created by Gert-Jan on 6/4/13.
//  Copyright (c) 2013 Gert-Jan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOCMainViewController.h" 
#import "LOCNavigationViewController.h"

@interface LOCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LOCMainViewController *mainViewController;
@property (strong, nonatomic) LOCNavigationViewController *navigationViewController;


@end
