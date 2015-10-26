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


//-(void)setCreated_at:(NSString *)created_at
//{
//    NSDateFormatter *inputFormatter =[[NSDateFormatter alloc] init];
//    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate* inputDate = [inputFormatter dateFromString:created_at];
//    NSLog(@"date = %@", inputDate);
//    
//    _created_at=[NSString stringWithFormat:@"%@",inputDate];
//}

@end
