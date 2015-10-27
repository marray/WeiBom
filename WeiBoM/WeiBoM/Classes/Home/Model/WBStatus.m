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
    //标准化
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc ] initWithLocaleIdentifier:@"en_US"] ;
    fmt.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    
    //创建时间
    NSDate *create_date=[fmt dateFromString:_created_at];
    
    //当前时间
    NSDate *now=[NSDate date];
    
    //用日历来获取年月日 来比较
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSCalendarUnit component=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    NSDateComponents *ndc=[calendar components:component fromDate:create_date toDate:now options:0];
    
    //时间比较
    
    if ([NSDate isThisYear:create_date]) {  //今年
        if ([NSDate isYesterday:create_date]){  //昨天
            
            fmt.dateFormat=@"昨天 HH:mm";
            return [fmt stringFromDate:create_date];
            
        }else if([NSDate isToday:create_date]){  //今天
            if(ndc.hour >= 1){
                
                return [NSString stringWithFormat:@"%ld小时前",(long)ndc.hour];
                
            }else if(ndc.minute >= 1){
                
                return [NSString stringWithFormat:@"%ld分钟前",(long)ndc.minute];
            }else{
                
                return @"刚刚";
            }
        }else{ //今年的其他
            
            fmt.dateFormat=@"MM-dd HH:mm";
            return [fmt stringFromDate:create_date];
        }
    }else {  //非今年
        
        fmt.dateFormat=@"yy-MM-dd";
        return [fmt stringFromDate:create_date];
    }
    
    return _created_at;
}

-(NSString *)source
{
    NSArray *array=[_source componentsSeparatedByString:@">"];
    NSString *sourceStr=[array[1] componentsSeparatedByString:@"<"][0];
    return [NSString stringWithFormat:@"来自 %@",sourceStr];
}


@end
