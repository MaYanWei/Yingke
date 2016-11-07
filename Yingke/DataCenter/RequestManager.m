//
//  RequestManager.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "RequestManager.h"
#import "RequestSessionManager.h"

@implementation RequestManager

+ (void)requestLiveListOnSucceeded:(ArrayBlock)arrayBlock onError:(ErrorBlock)errorBlock
{
    [RequestSessionManager get:@"http://120.55.238.158/api/live/infos?lc=0000000000000039&cc=TG0001&cv=IK3.6.10_Iphone&proto=7&idfa=83856DDD-64F8-43AA-B5F6-EC4BE2CBFA6B&idfv=BF195684-B719-43F9-A449-FF446C6BAC80&devi=5faa849f4e22fe104e7b5dcf388ed1c136637d19&osversion=ios_10.100000&ua=iPhone7_1&imei=&imsi=&uid=27243381&sid=20sMlazLljLhvw7E5fhqDNgei16epFLzvvOUTLqyi2pui2MPtjsQi3&conn=wifi&mtid=758fc9a46a017706bd8755bbd8f0dd4c&mtxid=acbc32ea75c9&logid=&id=1478495551433157%2C1478499642614826%2C1478496269726835%2C1478496770172928%2C1478497080424847&multiaddr=1&s_sg=a8b549753ce8aadaa7fb26f506a8cb61&s_sc=100&s_st=1478500232" parameters:nil success:^(id responseObject) {
        NSMutableArray *models = [LiveListItem objectArrayWithKeyValuesArray:[responseObject objectForKey:@"lives"]];
        arrayBlock(models);
    } failure:^(NSError *error) {
        errorBlock([error code], error.localizedDescription);
    }];
}

@end
