// 
// WBEmotionPageView.h
//
// IDECodeSnippetIdentifier: E78C6C86-BAAA-428E-A1FE-B01F7E414C39
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>

/**表情最大显示列数*/
#define WBEmotionMaxCols 7
/**表情最大显示行数*/
#define WBEmotionMaxRows 3
/**每一页的表情个数*/
#define WBEmotionPageSize ((WBEmotionMaxCols * WBEmotionMaxRows) - 1)

@interface WBEmotionPageView : UIView
/**每一页显示的表情数组*/
@property(nonatomic,strong) NSArray *emotions;

@end
