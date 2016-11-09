//
//  LivePanGestureRecognizer.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "LivePanGestureRecognizer.h"
#import "UIView+Frame.h"

@interface LivePanGestureRecognizer () <UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL moveFormMax;
@property (nonatomic, assign) CGFloat moveViewWidth;
@property (nonatomic, assign) CGFloat moveViewHalfWidth;

@end

@implementation LivePanGestureRecognizer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.moveLimit = 50;
        [self addTarget:self action:@selector(handlePanGesture:)];
    }
    return self;
}

- (void)setMoveView:(UIView *)moveView
{
    if (_moveView != moveView) {
        _moveView = moveView;
    }
    
    self.moveViewWidth = moveView.width;
    self.moveViewHalfWidth = self.moveViewWidth / 2.0;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture
{
    CGPoint translation = [panGesture translationInView:self.view];
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.moveFormMax = self.moveView.left == self.moveView.width;
        }
            break;
        case UIGestureRecognizerStateChanged: {
            [self setMoveOnView:self.moveView gestureViewCenterx:panGesture.view.center.x translationx:translation.x moveFormMax:self.moveFormMax];
        }
            break;
        case UIGestureRecognizerStateEnded: {
            if ([self gestureHorizontalWithTranslationx:translation.x y:translation.y limit:self.moveLimit]) {
                if (translation.x > 0)
                    [self scrollToMaxBorder];
                else
                    [self scrollToMinBorder];
            } else {
                [self panGestureUnable];
            }
        }
            break;
        default:
            break;
    }
}

- (void)setMoveOnView:(UIView *)moveView gestureViewCenterx:(CGFloat)gestureViewCenterx translationx:(CGFloat)x moveFormMax:(BOOL)moveFormMax
{
    CGFloat centerx = gestureViewCenterx + x;
    if (moveView.left >= self.moveViewHalfWidth && x < 0) {
        if (centerx > self.moveViewWidth) {
            centerx = self.moveViewWidth;
        }
        moveView.centerx = self.moveViewWidth + centerx;
    } else {
        if (x < 0 && self.moveView.left > 0 && moveFormMax) {
            moveView.centerx = self.moveViewWidth + centerx;
        } else {
            if (moveView.left == self.moveViewWidth) {
                moveView.left = self.moveViewWidth;
            } else {
                if (centerx < self.moveViewHalfWidth) {
                    centerx = self.moveViewHalfWidth;
                }
                moveView.centerx = centerx;
            }
        }
    }
}

- (void)scrollToMaxBorder
{
    [self scrollOnView:self.moveView border:self.moveViewWidth];
}

- (void)scrollToMinBorder
{
    [self scrollOnView:self.moveView border:0];
}

- (void)scrollOnView:(UIView *)moveView border:(CGFloat)border
{
    [UIView animateWithDuration:0.25 animations:^{
        moveView.left = border;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)panGestureUnable
{
    if (self.moveView.left > self.moveViewHalfWidth) {
        [self scrollToMaxBorder];
    } else {
        [self scrollToMinBorder];
    }
}

- (BOOL)gestureHorizontalWithTranslationx:(CGFloat)x y:(CGFloat)y limit:(CGFloat)limit
{
    BOOL gestureHorizontal;
    
    if (fabs(x) > limit) {
        if (y == 0)
            gestureHorizontal = YES;
        else
            gestureHorizontal = (fabs(x / y) > 2.0);
    } else {
        gestureHorizontal = NO;
    }
    
    return gestureHorizontal;
}

@end
