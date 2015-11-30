// 
// UITextView+Extension.h
//
// IDECodeSnippetIdentifier: 39911D86-8052-4949-ADD0-686D31D39F2A
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>

@interface UITextView (Extension)

- (void)insertAttributedText:(NSAttributedString *)text;

- (void)insertAttributedText:(NSAttributedString *)text withBlock:(void(^)(NSMutableAttributedString *lastAtrStr))fontBlock;

@end
