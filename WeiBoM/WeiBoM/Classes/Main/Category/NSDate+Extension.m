// 
// NSDate+Extension.m
//
// IDECodeSnippetIdentifier: D0054ACF-A6D4-4F0E-B453-E5E1A3BDD58B
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  判断是否为今年
 *
 *  @return BOOL YES NO
 */
-(BOOL)isThisYear
{
    NSDate *now=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *compsC=[calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *compsN=[calendar components:NSCalendarUnitYear fromDate:now];
    
    return compsC.year == compsN.year;
}
/**
 *  判断是否为昨天
 *
 *  @return BOOL YES NO
 */
-(BOOL)isYesterday
{
    NSDate *now=[NSDate date];
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd";
    
    //转化成去掉时分秒的格式的日期字符串
    NSString *createStr=[fmt stringFromDate:self];
    NSString *nowStr=[fmt stringFromDate:now];
    
    //转化成去掉时分秒的格式的日期
    NSDate *createDate=[fmt dateFromString:createStr];
    now=[fmt dateFromString:nowStr];
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSCalendarUnit unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps=[calendar components:unit fromDate:createDate toDate:now options:0];
    
    return comps.year == 0 && comps.month == 0 && comps.day == 1 ;
}

/**
 *  判断是否为今天
 *
 *  @return BOOL YES NO
 */
-(BOOL)isToday
{
    NSDate *now=[NSDate date];
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd";
    NSString *createStr=[fmt stringFromDate:self];
    NSString *nowStr=[fmt stringFromDate:now];
    
    return [createStr isEqualToString:nowStr];
}

@end
