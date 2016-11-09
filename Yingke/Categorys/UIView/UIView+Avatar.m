//
//  UIView+Avatar.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "UIView+Avatar.h"

@implementation UIView (Avatar)

- (void)configureViewCircleType
{
    self.layer.cornerRadius = self.width / 2.0;
    self.layer.masksToBounds = YES;
}

@end
