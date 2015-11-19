//
//  WBEmotionAttachment.h
//  WeiBoM
//
//  Created by Michael on 11/18/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBEmotion;

@interface WBEmotionAttachment : NSTextAttachment
@property(nonatomic,strong) WBEmotion *emotion;

@end
