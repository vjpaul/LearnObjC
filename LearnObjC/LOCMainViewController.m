//
//  LOCMainViewController.m
//  LearnObjC
//
//  Created by Gert-Jan on 6/4/13.
//  Copyright (c) 2013 Gert-Jan. All rights reserved.
//

#import "LOCMainViewController.h"

@interface LOCMainViewController ()
{
    NSDate *updatedAt;
}
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, getter = isLoadingData ) BOOL loadingData;

- (void) setMainLabelText:(NSString *)mainLabelText;
-(void)loadData;

@end

@implementation LOCMainViewController


- (id) init;
{
    if( self = [ super init])
    {
       
    }
    return self;
}

- (NSString *) title;
{
    return  @"Hallo Objective-C";
    
}

- (void) viewDidLoad;
{
    [super viewDidLoad];

    [self.view addSubview:self.activityIndicatorView];
    [self.view addSubview:self.mainLabel];

}

- (void) viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    self.activityIndicatorView.frame = CGRectMake(self.view.frame.size.width/2.f - 22.f, 200.f, 44.f, 44.f);
}

-(void) viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
}

#pragma mark - Public API

- (void) loadData;
{
    if(self.loadingData ) return;
    
    if( [[NSDate date] timeIntervalSinceDate:updatedAt] < 10.f )
    {
        self.mainLabel.text = @"Please wait for 10 seconds";
        [self.mainLabel sizeToFit ];
        
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            self.mainLabel.text = @"Learning Objective-C";
            
        });
        return;
    }
    
    self.loadingData = YES;
    updatedAt = [NSDate date];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.loadingData = NO;
        
    });
}

#pragma mark - Private API
- (void)setLoadingData:(BOOL)loadingData;
{
    _loadingData = loadingData;
    if ( _loadingData)
    {
        [UIView animateWithDuration:0.3f animations:^{
            
            CGRect rect = self.mainLabel.frame;
            rect.origin.y = rect.origin.y - 44.f;
            self.mainLabel.frame = rect;
            
        } completion:^(BOOL finished) {
            
            [self.activityIndicatorView startAnimating];
                
        }];
    }else{
        
        [self.activityIndicatorView stopAnimating];
        
        [UIView animateWithDuration:0.3f animations:^{
            
            CGRect rect = self.mainLabel.frame;
            rect.origin.y = rect.origin.y + 44.f;
            self.mainLabel.frame = rect;
            
        } completion:^(BOOL finished) {}];
        
    }
}
- (UIActivityIndicatorView *)activityIndicatorView
{
   if(!_activityIndicatorView)
   {
       UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
       aiv.hidesWhenStopped = YES;
       aiv.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
       _activityIndicatorView = aiv;
   }
    return _activityIndicatorView;
}


- (IBAction)loadDataButtonTapped:(id)sender {
    [self loadData];
    
    //[self.loadDataButton setBackgroundImage:[[UIImage imageNamed:@"big-button"] resizableImageWithCapInsets:UIEdgeInsetsMake(4.f, 4.f, 4.f, 4.f)]
    //                               forState:UIControlStateNormal];
    
    //[self.loadDataButton setBackgroundImage:[[UIImage imageNamed:@"big-button-highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(4.f, 4.f, 4.f, 4.f)]
    //                               forState:UIControlStateHighlighted];
    
    //[self.loadDataButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    //[self.loadDataButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

- (void) setMainLabelText:(NSString *)mainLabelText;
{
    self.mainLabel.text = mainLabelText;
    [self.mainLabel sizeToFit];
    
    CGRect rect = self.mainLabel.frame;
    rect.size.width = 230.f;
    rect.origin.x =self.view.frame.size.width / 2.f - rect.size.width /2.f;
    self.mainLabel.frame = rect;
}


@end
