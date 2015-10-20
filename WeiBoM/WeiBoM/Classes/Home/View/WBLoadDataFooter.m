//
//  WBLoadDataFooter.m
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBLoadDataFooter.h"

@implementation WBLoadDataFooter

+(instancetype)load
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WBLoadDataFooter" owner:nil options:nil] firstObject];
}

@end
