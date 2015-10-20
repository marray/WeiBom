//
//  WBStatus.h
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBUser;
@interface WBStatus : NSObject

/** string	字符串型的微博ID */
@property(nonatomic,copy) NSString *idstr;

/** string	微博信息内容 */
@property(nonatomic,copy) NSString *text;

/** object	微博作者的用户信息字段 详细 */
@property(nonatomic,strong) WBUser *user;

+(instancetype)statusWithDict:(NSDictionary *)dictionary;
@end
