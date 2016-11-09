//
//  UIView+FirstViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "UIView+FirstViewController.h"

@implementation UIView (FirstViewController)

- (UIViewController *)getViewController
{
    id nextResponder = [self nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder getViewController];
    } else {
        return nil;
    }
}

- (UINavigationController *)getNavigationController
{
    UIResponder *responder = self.nextResponder;
    
    while (responder) {
        if (responder == nil) {
            return nil;
        } else if ([responder isKindOfClass:[UIViewController class]]) {
            UIViewController *controller = (UIViewController *)responder;
            if (controller.navigationController == nil) {
                responder = controller.view.nextResponder;
            } else {
                return (UINavigationController *)controller.navigationController;
            }
        }
        responder = responder.nextResponder;
    }
    return nil;
}

@end
