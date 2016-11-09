//
//  BaseNavigationController.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseNavigationController.h"
#import "LiveAudienceViewController.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}

#pragma mark

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[LiveAudienceViewController class]]) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
    } else {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - View rotation

- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

@end
