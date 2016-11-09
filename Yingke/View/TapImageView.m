//
//  TapImageView.m
//  Mingtian
//
//  Created by mayw on 16/8/15.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "TapImageView.h"

@interface TapImageView ()

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) id object;

@end

@implementation TapImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_target respondsToSelector:_action]) {
        SuppressPerformSelectorLeakWarning([_target performSelector:_action withObject:self]);
    }
}

@end
