//
//  TransformHelper.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "TransformHelper.h"

@implementation TransformHelper

+ (NSString *)transCity:(NSString *)city
{
    if (city.length == 0) {
        return @"难道在火星？";
    } else {
        return city;
    }
}

@end
