//
//  WBUser.m
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBUser.h"

@implementation WBUser

-(void)setMbtype:(int)mbtype
{
    _mbtype=mbtype;
    
    self.vip=mbtype > 2;
}

@end
