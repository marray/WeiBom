//
//  NSDate+Extension.m
//  WeiBoM
//
//  Created by Michael on 10/27/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  判断是否为今年
 *
 *  @param date 创建日期
 *
 *  @return BOOL YES NO
 */
+(BOOL)isThisYear:(NSDate *)date
{
    NSDate *now=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *compsC=[calendar components:NSCalendarUnitYear fromDate:date];
    NSDateComponents *compsN=[calendar components:NSCalendarUnitYear fromDate:now];
    
    return compsC.year == compsN.year;
}
/**
 *  判断是否为昨天
 *
 * @param date 创建日期
 *
 *  @return BOOL YES NO
 */
+(BOOL)isYesterday:(NSDate *)date
{
    NSDate *now=[NSDate date];
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd";
    
    //转化成去掉时分秒的格式的日期字符串
    NSString *createStr=[fmt stringFromDate:date];
    NSString *nowStr=[fmt stringFromDate:now];
    
    //转化成去掉时分秒的格式的日期
    NSDate *createDate=[fmt dateFromString:createStr];
    NSDate *nowDate=[fmt dateFromString:nowStr];
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSCalendarUnit unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps=[calendar components:unit fromDate:createDate toDate:nowDate options:0];
    
    return comps.year == 0 && comps.month == 0 && comps.day == 1 ;
}

/**
 *  判断是否为今天
 *
 * @param date 创建日期
 *
 *  @return BOOL YES NO
 */
+(BOOL)isToday:(NSDate *)date
{
    NSDate *now=[NSDate date];
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd";
    NSString *createStr=[fmt stringFromDate:date];
    NSString *nowStr=[fmt stringFromDate:now];
    
    return [createStr isEqualToString:nowStr];
}

@end
