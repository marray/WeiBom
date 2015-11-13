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
        
        //之前文字附加
        NSMutableAttributedString *attrStr=[[NSMutableAttributedString alloc] init];
        [attrStr appendAttributedString:self.attributedText];
        
        //插入图片表情
        NSUInteger location=self.selectedRange.location;
        [attrStr insertAttributedString:imageStr atIndex:location];
        
        //设置字体
        [attrStr addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attrStr.length)];
        
        self.attributedText=attrStr;
        
        //添加完所有字符之后，移动光标位置到刚添加的表情图片后面一个位置
        self.selectedRange=NSMakeRange(location + 1, 0);
    }
    
    /**
     * self.textView.font只对 设置text时有用，对attributedText属性没有用
     *
     */
}

@end
