//
//  NSDate+Extension.h
//  WeiBoM
//
//  Created by Michael on 10/27/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  判断是否为今年
 */
-(BOOL)isThisYear;
/**
 *  判断是否为昨天
 */
-(BOOL)isYesterday;
/**
 *  判断是否为今天
 */
-(BOOL)isToday;

@end
