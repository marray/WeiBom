// 
// WBDropDownMenu.h
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 5CA29FB0-5F1B-41B5-82DC-5BFCFAB38887
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import <UIKit/UIKit.h>

@interface WBDropDownMenu : UIView

/**
 *  创建菜单
 *
 *  @return 返回对象
 */
+(instancetype)menue;
/**
 *  显示菜单
 */
-(void)showFrom:(UIView *)from;

/**
 *  销毁
 */
-(void)dismiss;

@property(nonatomic,strong) UIView *content;

@property(nonatomic,strong) UIViewController *contentController;

@end
