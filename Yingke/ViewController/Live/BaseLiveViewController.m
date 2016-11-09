//
//  BaseLiveViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseLiveViewController.h"

@interface BaseLiveViewController ()

@end

@implementation BaseLiveViewController

#pragma mark - Property

- (LivingView *)livingView
{
    if (!_livingView) {
        _livingView = [[LivingView alloc] initWithFrame:self.view.bounds liveType:self.liveType];
    }
    return _livingView;
}

#pragma mark - Life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCloseBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].idleTimerDisabled = NO;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - View

- (void)initCloseBtn
{
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.backgroundColor = [UIColor grayColor];
    closeBtn.frame = CGRectMake(self.view.width - 100, self.view.height - 100, 50, 50);
    [closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
}

#pragma mark - Event

- (void)closeBtnClick:(UIButton *)closeBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
