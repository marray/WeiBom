//
//  WBEmotionTool.h
//  WeiBoM
//
//  Created by Michael on 11/17/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBEmotion;

@interface WBEmotionTool : NSObject

+(void)saveRecentEmotion:(WBEmotion *)emotion;

+(NSArray *)recentEmotion;

@end
