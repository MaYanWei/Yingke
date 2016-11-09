//
//  LivePanGestureRecognizer.h
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LivePanGestureRecognizer : UIPanGestureRecognizer

@property (nonatomic, weak) UIView *moveView;
@property (nonatomic, assign) CGFloat moveLimit;

@end
