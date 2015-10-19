//
//  WBAccountManager.m
//  WeiBoM
//
//  Created by IceMi on 15/10/18.
//  Copyright © 2015年 agIce. All rights reserved.
//

#import "WBAccountManager.h"
#import "WBAccount.h"

#define WBAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation WBAccountManager

+(void)save:(WBAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:WBAccountPath];

}

+(WBAccount *)account
{
    WBAccount *account=[NSKeyedUnarchiver unarchiveObjectWithFile:WBAccountPath];
    
    //验证授权是否过期
    
    //允许过期时间
    long long expires_in=[account.expires_in longLongValue];
    //过期时间
    NSDate *expiresTime=[account.create_time dateByAddingTimeInterval:expires_in];
    //当前时间
    NSDate *now=[NSDate date];
    //比较两段时间判断是否过期
    //{NSOrderedAscending = -1L 升序, NSOrderedSame 相同, NSOrderedDescending 降序}
    NSComparisonResult result=[expiresTime compare:now];
    if (result != NSOrderedDescending) {
        //过期
        return nil;
    }
    return account;
}
@end
