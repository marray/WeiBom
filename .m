// 
// UIButton+WBButton.h
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 2FDB5079-86CD-4EC2-80DC-4C743840E647
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import <UIKit/UIKit.h>

@interface UIButton (WBButton)
+(UIButton *)buttonWithTarget:(id)target Width:(CGFloat)width height:(CGFloat)height centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(NSString *)image selectImage:(NSString *)selectImage action:(SEL)action;

+(UIButton *)buttonWithTarget:(id)target size:(CGSize)size centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title backImage:(NSString *)backImage backHighImage:(NSString *)backHighImage action:(SEL)action;
@end
