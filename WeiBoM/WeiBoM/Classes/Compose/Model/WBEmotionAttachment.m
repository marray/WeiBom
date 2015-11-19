//
//  WBEmotionAttachment.m
//  WeiBoM
//
//  Created by Michael on 11/18/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionAttachment.h"
#import "WBEmotion.h"

@implementation WBEmotionAttachment

-(void)setEmotion:(WBEmotion *)emotion
{
    _emotion=emotion;
    
    self.image=[UIImage imageNamed:emotion.png];
}

@end
