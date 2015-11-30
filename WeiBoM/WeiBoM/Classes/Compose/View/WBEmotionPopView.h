// 
// WBEmotionPopView.h
//
// IDECodeSnippetIdentifier: B5BC3A37-F7B7-4097-871C-8ED3B8D665BE
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBEmotion , WBEmotionButton;

@interface WBEmotionPopView : UIView

/**
 * 创建一个popView对象
 */
+(instancetype)popView;

/**
 * 通过一个按钮模型 显示一个popview
 */
-(void)showPopViewWithButton:(WBEmotionButton *)button;

@end
