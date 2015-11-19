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
    if ([create_date isThisYear]) {  //今年
        if ([create_date isYesterday]){  //昨天
            
            fmt.dateFormat=@"昨天 HH:mm";
            return [fmt stringFromDate:create_date];
            
        }else if([create_date isToday]){  //今天
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

-(void)setSource:(NSString *)source
{
    _source=source;
    
    if (source.length) {
        NSRange range;
        range.location=[source rangeOfString:@">"].location + 1;
        range.length=[source rangeOfString:@"</"].location -range.location;
        _source=[NSString stringWithFormat:@"来自 %@",[source substringWithRange:range]];
    }
}

//-(NSString *)fullText
//{
//    [self.text enumerateSubstringsInRange:NSMakeRange(0, self.text.length) options:0 usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
//        WBLOG(@"substring:%@---substringRange:%@---enclosingRange:%@",substring,NSStringFromRange(substringRange),NSStringFromRange(enclosingRange));
//    }];
//    return self.text;
//}


@end
