//
//  LiveAudienceViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "LiveAudienceViewController.h"
#import "LivePanGestureRecognizer.h"

@interface LiveAudienceViewController ()

@end

@implementation LiveAudienceViewController

#pragma mark - Life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.liveType = LiveTypeAudience;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [self.view sendSubviewToBack:view];
    
    LivePanGestureRecognizer *gestureRecognizer = [[LivePanGestureRecognizer alloc] init];
    gestureRecognizer.moveView = view;
    [self.view addGestureRecognizer:gestureRecognizer];
}

@end
