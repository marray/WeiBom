//
//  WBStatus.m
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBStatus.h"
#import "WBUser.h"

@implementation WBStatus

+(instancetype)statusWithDict:(NSDictionary *)dictionary
{
    WBStatus *status=[[WBStatus alloc] init];
    status.idstr=dictionary[@"idstr"];
    status.text=dictionary[@"text"];
    status.user=[WBUser userWithDict:dictionary[@"user"]];
    return status;
}
@end
