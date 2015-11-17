//
//  WBEmotionTool.m
//  WeiBoM
//
//  Created by Michael on 11/17/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionTool.h"
#import "WBEmotion.h"

#define WBRecentEmotionPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"recentEmotions.archive"]

@implementation WBEmotionTool

+(void)saveRecentEmotion:(WBEmotion *)emotion
{
    NSMutableArray *emotions=(NSMutableArray *)[self recentEmotion];
    if (emotions == nil) {
        emotions=[NSMutableArray array];
    }else{
        for (int i=0; i< emotions.count; i++) {
            WBLOG(@"for循环");
            WBEmotion *oneEmotion=emotions[i];
            if ([oneEmotion.chs isEqualToString:emotion.chs] || [oneEmotion.code isEqualToString:emotion.code]) {
                [emotions removeObject:oneEmotion];
                WBLOG(@"%@",oneEmotion.chs);
            }
        }
    }
    
    //插入到数组最前面
    [emotions insertObject:emotion atIndex:0];
    
    //存储到沙盒
    [NSKeyedArchiver archiveRootObject:emotions toFile:WBRecentEmotionPath];
}

+(NSArray *)recentEmotion
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:WBRecentEmotionPath];
}


@end
