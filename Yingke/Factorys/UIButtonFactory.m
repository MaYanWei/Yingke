//
//  UIButtonFactory.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "UIButtonFactory.h"

@implementation UIButtonFactory

+ (void)configureBtn:(UIButton *)button type:(MWBtnType)type
{
    if (type == MWBtnTypeStatusLiving) {
        button.layer.cornerRadius = button.height / 2.0;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 1;
        button.layer.borderColor = kFFFFFF.CGColor;
        [button setTitleColor:kFFFFFF forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.2];
    }
}

@end
