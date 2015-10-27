//
//  WBStatus.m
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBStatus.h"
#import "WBUser.h"
#import "MJExtension.h"
#import "WBPhoto.h"

@implementation WBStatus
/**
 *  设置数组中存放WHPhoto模型
 */
-(NSDictionary *)objectClassInArray
{
    return @{@"pic_urls" : [WBPhoto class]};
}

-(NSString *)created_at
{
    return @"刚刚";
}

@end
