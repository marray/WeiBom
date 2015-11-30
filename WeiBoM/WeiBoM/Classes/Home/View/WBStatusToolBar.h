// 
// WBStatusToolBar.h
//
// IDECodeSnippetIdentifier: E9DD0C30-7A61-4118-8CF8-11125BE193E7
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBStatus;

typedef enum {
    WBStatusToolBarButtonTypeRetweet,  //转发
    WBStatusToolBarButtonTypeComment,  //评论
    WBStatusToolBarButtonTypeAtitude   //点赞
}WBStatusToolBarButtonType;

@interface WBStatusToolBar : UIView
+(instancetype)toolbar;

@property(nonatomic,strong) WBStatus *status;

@end
