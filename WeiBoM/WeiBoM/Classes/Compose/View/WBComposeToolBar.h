// 
// WBComposeToolBar.h
//
// IDECodeSnippetIdentifier: F56F74AE-7924-4A9F-9611-88D2D0686735
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBComposeToolBar;

typedef enum{
    composeToolBarButtonTypeCamera,  //照相
    composeToolBarButtonTypePicture, //相册
    composeToolBarButtonTypeMention, //@
    composeToolBarButtonTypeTrend,   //#
    composeToolBarButtonTypeEmotion  //表情
}composeToolBarButtonType;

@protocol WBComposeToolBarDelegate <NSObject>
@optional
-(void)composeToolBar:(WBComposeToolBar *)composeToolBar buttonDidClick:(composeToolBarButtonType)buttonType;

@end

@interface WBComposeToolBar : UIView

@property(nonatomic,strong) id<WBComposeToolBarDelegate> delegate;

@property(nonatomic,assign) BOOL isChangeKeyborad;

@end
