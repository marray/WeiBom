//
//  WBHttpTool.m
//  WeiBoM
//
//  Created by Michael on 11/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBHttpTool.h"
#import "AFNetworking.h"

@implementation WBHttpTool


+(void)get:(NSString *)path params:(NSDictionary *)params success:(void(^)(id data))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)post:(NSString *)path params:(NSDictionary *)params success:(void(^)(id data))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)post:(NSString *)path params:(NSDictionary *)params constructingBodyWithBlock:(void(^)(id<AFMultipartFormData> formData))dataBlock  success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (dataBlock) {
            dataBlock(formData);
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end
