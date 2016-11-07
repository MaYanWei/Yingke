//
//  LiveListItem.h
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreatorItem.h"

@interface LiveListItem : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *multi;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *online_users;
@property (nonatomic, strong) NSString *optimal;
@property (nonatomic, strong) NSString *pub_stat;
@property (nonatomic, strong) NSString *room_id;
@property (nonatomic, strong) NSString *rotate;
@property (nonatomic, strong) NSString *share_addr;
@property (nonatomic, strong) NSString *slot;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *stream_addr;
@property (nonatomic, strong) NSString *version;

@property (nonatomic, strong) CreatorItem *creator;

@end
