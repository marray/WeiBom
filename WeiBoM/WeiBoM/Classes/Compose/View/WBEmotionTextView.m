//
//  WBEmotionTextView.m
//  WeiBoM
//
//  Created by Michael on 11/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionTextView.h"
#import "WBEmotion.h"

@implementation WBEmotionTextView

/**插入图文混排字符*/
-(void)insertTextEmotion:(WBEmotion *)emotion
{
    if (emotion.code) {  //Emoji表情
        [self insertText:emotion.code.emoji];
        
    }else if(emotion.png){  //图片表情
        
        //图片表情附加
        NSTextAttachment *attach=[[NSTextAttachment alloc] init];
        attach.image=[UIImage imageNamed:emotion.png];
        //设置图片插入的大小
        CGFloat lineHight=self.font.lineHeight;
        attach.bounds=CGRectMake(0, -4, lineHight, lineHight);
        NSAttributedString *imageStr=[NSAttributedString attributedStringWithAttachment:attach];
        
//        [self insertAttributedText:imageStr];
        [self insertAttributedText:imageStr withBlock:^(NSMutableAttributedString *lastAtrStr) {
            //设置字体
            [lastAtrStr addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, lastAtrStr.length)];
        }];
        
    }
    
    
}

@end
