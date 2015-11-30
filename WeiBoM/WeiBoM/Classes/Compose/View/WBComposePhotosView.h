// 
// WBComposePhotosView.h
//
// IDECodeSnippetIdentifier: 505A0E84-29CE-4420-9F24-8195195D910B
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>

@interface WBComposePhotosView : UIView

-(void)addPhoto:(UIImage *)photo;

@property(nonatomic,strong,readonly) NSMutableArray *photos;

@end
