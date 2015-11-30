// 
// WBEmotionAttachment.m
//
// IDECodeSnippetIdentifier: 128444E8-E26C-4AC4-A629-00DCE8A4A685
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBEmotionAttachment.h"
#import "WBEmotion.h"

@implementation WBEmotionAttachment

-(void)setEmotion:(WBEmotion *)emotion
{
    _emotion=emotion;
    
    self.image=[UIImage imageNamed:emotion.png];
}

@end
