//
//  WBAccount.h
//  WeiBoM
//
//  Created by IceMi on 15/10/18.
//  Copyright © 2015年 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccount : NSObject <NSCoding>

/**access_token	string	用于调用access_token，接口获取授权后的access token。*/
@property(nonatomic,copy) NSString *access_token;

/**expires_in	string	access_token的生命周期，单位是秒数。*/
@property(nonatomic,copy) NSString *expires_in;

/**uid	string	当前授权用户的UID。*/
@property(nonatomic,copy) NSString *uid;

/**create_time	NSDate	创建accessToken时的时间 */
@property(nonatomic,copy) NSDate *create_time;

/**name	NSString 用户名 */
@property(nonatomic,copy) NSString *name;

+(instancetype)accountWithDict:(NSDictionary *)dic;
@end
