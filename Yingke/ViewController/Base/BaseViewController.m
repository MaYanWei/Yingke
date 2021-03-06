//
//  BaseViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kF0F0F0;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.navigationBarHidden) {
        self.navigationController.navigationBarHidden = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.navigationBarHidden) {
        self.navigationController.navigationBarHidden = NO;
    }
}

#pragma mark - View rotation

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
