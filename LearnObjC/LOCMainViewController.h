//
//  LOCMainViewController.h
//  LearnObjC
//
//  Created by Gert-Jan on 6/4/13.
//  Copyright (c) 2013 Gert-Jan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOCMainViewController.h"

@interface LOCMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UIButton *loadDataButton;
- (IBAction)loadDataButtonTapped:(id)sender;

@end
