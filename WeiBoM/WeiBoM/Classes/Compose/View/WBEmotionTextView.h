//
//  WBEmotionTextView.h
//  WeiBoM
//
//  Created by Michael on 11/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBTextView.h"
@class WBEmotion;

@interface WBEmotionTextView : WBTextView

-(void)insertTextEmotion:(WBEmotion *)emotion;

-(NSString *)wholeText;
@end
