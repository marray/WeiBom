// 
// WBStatusPhotosView.h
//
// IDECodeSnippetIdentifier: FDC686CE-A41B-444F-BC08-2BA75705DD75
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>

@interface WBStatusPhotosView : UIView

@property(nonatomic,strong) NSArray *photos;
/**
 *   根据图片数计算总体的尺寸
 */
+(CGSize)sizeWithCount:(NSUInteger)count;

@end
