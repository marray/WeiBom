// 
// WBStatusFrame.h
//
// IDECodeSnippetIdentifier: D88D0456-8900-42F1-897C-469433211FCC
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <Foundation/Foundation.h>

//昵称字体
#define WbStatusNameLabelFont [UIFont systemFontOfSize:14]
//发布时间字体
#define WbStatusTimeLabelFont [UIFont systemFontOfSize:11]
//发布来源字体
#define WbStatusSourceLabelFont WbStatusTimeLabelFont
//原创正文字体
#define WbStatusContentLabelFont [UIFont systemFontOfSize:13]
//转发正文字体
#define WbStatusRetweetContentLabelFont WbStatusContentLabelFont
//cell之间的间距
#define WBStautsCellMargin 10
//边距
#define WBStautsCellBoundsW 10

@class WBStatus;

@interface WBStatusFrame : NSObject

@property(nonatomic,strong) WBStatus *status;

/** 原创微博整体 */
@property(nonatomic,assign) CGRect originalViewFrame;

/** 用户头像 */
@property(nonatomic,assign) CGRect iconImageFrame;

/** vip图片 */
@property(nonatomic,assign) CGRect vipImageFrame;

/** 用户昵称 */
@property(nonatomic,assign) CGRect nameLabelFrame;

/** 创建时间 */
@property(nonatomic,assign) CGRect timeLabelFrame;

/** 发布来源 */
@property(nonatomic,assign) CGRect sourceLabelFrame;

/** 原创微博正文 */
@property(nonatomic,assign) CGRect contentLabelFrame;

/**原创微博图片*/
@property(nonatomic,assign) CGRect contentPhotosViewFrame;


/** 转发微博整体 */
@property(nonatomic,assign) CGRect retweetViewFrame;

/** 转发微博正文 + 昵称 */
@property(nonatomic,assign) CGRect retweetContentLabelFrame;

/** 转发微博图片 */
@property(nonatomic,assign) CGRect retweetContentPhotosViewFrame;


/** 工具条 */
@property(nonatomic,assign) CGRect toolBarViewFrame;

/**cell的高度*/
@property(nonatomic,assign) CGFloat cellHeigh;

@end
