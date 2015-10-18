//
//  WBAccount.m
//  WeiBoM
//
//  Created by IceMi on 15/10/18.
//  Copyright © 2015年 agIce. All rights reserved.
//

#import "WBAccount.h"

@implementation WBAccount
+(instancetype)accountWithDict:(NSDictionary *)dic
{
    WBAccount *account=[[self alloc] init];
    account.access_token=dic[@"access_token"];
    account.expires_in=dic[@"expires_in"];
    account.uid=dic[@"uid"];
    return account;
}
/**
 一个对象归档到沙盒时调用的方法
 */
-(void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.access_token forKey:@"access_token"];
    [enCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [enCoder encodeObject:self.uid forKey:@"uid"];
    [enCoder encodeObject:self.create_time forKey:@"create_time"];

}
/**
 沙盒中解档对象时调用的方法
 */
-(instancetype)initWithCoder:(NSCoder *)decoder
{
    if(self=[super init]){
        self.access_token=[decoder decodeObjectForKey:@"access_token"];
        self.expires_in=[decoder decodeObjectForKey:@"expires_in"];
        self.uid=[decoder decodeObjectForKey:@"uid"];
        self.create_time=[decoder decodeObjectForKey:@"create_time"];
    }
    return self;
}

@end
