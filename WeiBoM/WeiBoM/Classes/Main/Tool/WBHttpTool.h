//
//  WBHttpTool.h
//  WeiBoM
//
//  Created by Michael on 11/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface WBHttpTool : NSObject

+(void)get:(NSString *)path params:(NSDictionary *)params success:(void(^)(id data))success failure:(void(^)(NSError *error))failure;

+(void)post:(NSString *)path params:(NSDictionary *)params success:(void(^)(id data))success failure:(void(^)(NSError *error))failure;

+(void)post:(NSString *)path params:(NSDictionary *)params constructingBodyWithBlock:(void(^)(id<AFMultipartFormData> formData))dataBlock  success:(void (^)(id data))success failure:(void (^)(NSError *error))failure;
@end
