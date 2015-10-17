// 
// WBTabBar.h
//
// IDECodeSnippetIdentifier: AF66DAD2-B2EB-47A9-92C0-A1D1F1941918
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBTabBar;

@protocol WBTabBarDelegate <UITabBarDelegate>

@optional
-(void)tabBarDidPlusClick:(WBTabBar *)tabBar;

@end

@interface WBTabBar : UITabBar
+(instancetype)tabBar;

@property(nonatomic,weak) id<WBTabBarDelegate> delegate;
@end
