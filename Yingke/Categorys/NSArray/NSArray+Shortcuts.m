//
//  NSArray+Shortcuts.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "NSArray+Shortcuts.h"

@implementation NSArray (Shortcuts)

- (BOOL)containsObjectAtIndex:(NSInteger)index
{
    return index >= 0 && index < self.count;
}

- (id)objectNilAtIndex:(NSInteger)index
{
    return [self containsObjectAtIndex:index] ? [self objectAtIndex:index] : nil;
}

@end
