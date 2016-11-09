//
//  UIButtonFactory.h
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MWBtnType)
{
    MWBtnTypeStatusLiving = 1
};

@interface UIButtonFactory : NSObject

+ (void)configureBtn:(UIButton *)button type:(MWBtnType)type;

@end
