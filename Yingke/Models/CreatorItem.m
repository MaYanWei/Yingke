//
//  CreatorItem.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "CreatorItem.h"

@implementation CreatorItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [CreatorItem setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"creatorId" : @"id",
                     };
        }];
    }
    return self;
}


@end
