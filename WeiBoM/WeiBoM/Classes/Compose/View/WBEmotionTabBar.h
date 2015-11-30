// 
// WBEmotionTabBar.h
//
// IDECodeSnippetIdentifier: ED1E382B-EADF-4873-AC9D-2C9C7A3FCE6C
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBEmotionTabBar;

typedef enum {
    WBEmotionTabBarButtonTypeRecent, //最近
    WBEmotionTabBarButtonTypeDefault, //默认
    WBEmotionTabBarButtonTypeEmoji,  //Emoji
    WBEmotionTabBarButtonTypeLxh  //浪小花
}WBEmotionTabBarButtonType;

@protocol WBEmotionTabBarDelegate <NSObject>

@optional
-(void)emotionTabBar:(WBEmotionTabBar *)tabBar withButtonType:(WBEmotionTabBarButtonType)buttonType;
@end

@interface WBEmotionTabBar : UIView
@property(nonatomic,weak) id<WBEmotionTabBarDelegate> delegate;
@end
