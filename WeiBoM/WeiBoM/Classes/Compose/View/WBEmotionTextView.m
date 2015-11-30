// 
// WBEmotionTextView.m
//
// IDECodeSnippetIdentifier: 0DEE7D8F-8A92-4538-84B0-3025D8D9C2CD
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBEmotionTextView.h"
#import "WBEmotion.h"
#import "WBEmotionAttachment.h"

@implementation WBEmotionTextView

/**插入图文混排字符*/
-(void)insertTextEmotion:(WBEmotion *)emotion
{
    if (emotion.code) {  //Emoji表情
        [self insertText:emotion.code.emoji];
        
    }else if(emotion.png){  //图片表情
        
        //图片表情附加
        WBEmotionAttachment *attach=[[WBEmotionAttachment alloc] init];
        attach.emotion=emotion;
        
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

-(NSString *)wholeText
{
    NSMutableString *wholeText=[NSMutableString string];
    
    //遍历文本中所有对象
    [self.attributedText enumerateAttributesInRange:NSMakeRange(0, self.attributedText.length) options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        
        WBEmotionAttachment *attachment=attrs[@"NSAttachment"];
        if (attachment) {
            [wholeText appendString:attachment.emotion.chs];
        }else{
            NSAttributedString *str=[self.attributedText attributedSubstringFromRange:range];
            [wholeText appendString:str.string];
        }
        
    }];
    return wholeText;
}

@end
