//
//  WBUser.m
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBUser.h"

@implementation WBUser

+(instancetype)userWithDict:(NSDictionary *)dictionary
{
    WBUser *user=[[WBUser alloc] init];
    user.idstr=dictionary[@"idstr"];
    user.name=dictionary[@"name"];
    user.profile_image_url=dictionary[@"profile_image_url"];
    return user;
}
@end
