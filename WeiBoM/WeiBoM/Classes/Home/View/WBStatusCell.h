// 
// WBStatusCell.h
//
// IDECodeSnippetIdentifier: 2B6DD821-680A-4743-9CDE-9083F55CD1B9
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <UIKit/UIKit.h>
@class WBStatusFrame;

@interface WBStatusCell : UITableViewCell
+(instancetype)cellwithTableView:(UITableView *)tableView;

/**微博数据模型*/
@property(nonatomic,strong) WBStatusFrame *statusFrame;

@end
