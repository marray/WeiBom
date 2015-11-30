// 
// WBEmotionTextView.h
//
// IDECodeSnippetIdentifier: 565E6CB8-D996-4F05-BED0-07563EFE14EB
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBTextView.h"
@class WBEmotion;

@interface WBEmotionTextView : WBTextView

-(void)insertTextEmotion:(WBEmotion *)emotion;

-(NSString *)wholeText;
@end
