//
//  RequestSessionManager.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "RequestSessionManager.h"

@implementation RequestSessionManager

+ (void)get:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [RequestSessionManager method:@"GET" url:url parameters:parameters success:success failure:failure];
}

+ (void)post:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [RequestSessionManager method:@"POST" url:url parameters:parameters success:success failure:failure];
}

+ (void)method:(NSString *)method url:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];

    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseRequestURL, url];
    [manager method:method urlString:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [RequestSessionManager handleSuccessWithTask:task responseObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        NSLog(@"url = %@, error = %@", error.localizedDescription, operation.originalRequest.URL);
        failure(error);
    }];
}

+ (void)handleSuccessWithTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    NSLog(@"url = %@, response = \n%@", task.originalRequest.URL, responseObject);
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        if ([[dict objectForKey:@"dm_error"] intValue] == 0) {
            success(dict);
        } else {
            NSInteger code = [[dict objectForKey:@"dm_error"] intValue];
            NSString *message = [dict objectForKey:@"error_msg"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
            NSError *error = [[NSError alloc] initWithDomain:@"custom_error" code:code userInfo:userInfo];
            failure(error);
        }
    }
}

@end
