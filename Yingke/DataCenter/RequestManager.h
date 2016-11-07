//
//  RequestManager.h
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveListItem.h"

typedef void (^ArrayBlock)(NSMutableArray *models);
typedef void (^ErrorBlock)(NSInteger code, NSString *message);

@interface RequestManager : NSObject

// 直播列表
+ (void)requestLiveListOnSucceeded:(ArrayBlock)arrayBlock onError:(ErrorBlock)errorBlock;

@end
