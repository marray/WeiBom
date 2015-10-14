// 
// UIBarButtonItem+Extension.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: DEE9B126-F1CB-4CF0-9821-A1F08E24135B
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建uibarbuttonItem按钮
 *
 *  @param target    目标控制器
 *  @param action    目标控制器的响应方法
 *  @param image     显示的图片
 *  @param highImage 高亮显示的图片
 *
 *  @return return 返回按钮
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.size=btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
