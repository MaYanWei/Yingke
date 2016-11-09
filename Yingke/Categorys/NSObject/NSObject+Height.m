//
//  NSObject+Height.m
//  Mingtian
//
//  Created by mayw on 16/8/3.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "NSObject+Height.h"
#import <objc/runtime.h>

static const void *CacheHeightKey = &CacheHeightKey;

@implementation NSObject (Height)

- (void)setCacheHeight:(NSString *)cacheHeight
{
    objc_setAssociatedObject(self, CacheHeightKey, cacheHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)cacheHeight
{
    return objc_getAssociatedObject(self, CacheHeightKey);
}

@end
