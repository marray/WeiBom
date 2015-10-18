//
//  WBAccountManager.h
//  WeiBoM
//
//  Created by IceMi on 15/10/18.
//  Copyright © 2015年 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBAccount;
@interface WBAccountManager : NSObject
/**
 将对象存储到沙盒中
 */
+(void)save:(WBAccount *)account;

/**从沙盒中取出对象*/
+(WBAccount *)account;

@end
