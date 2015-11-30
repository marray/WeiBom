// 
// WBEmotionTool.h
//
// IDECodeSnippetIdentifier: FFE4F5B2-A0A6-4D78-B05C-ECF26766C61A
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <Foundation/Foundation.h>

@class WBEmotion;

@interface WBEmotionTool : NSObject

+(void)saveRecentEmotion:(WBEmotion *)emotion;

+(NSArray *)recentEmotion;

@end
