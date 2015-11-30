// 
// WBStatus.h
//
// IDECodeSnippetIdentifier: 238391BF-B84C-48C1-8ED6-93F0097A433F
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import <Foundation/Foundation.h>
@class WBUser;
@interface WBStatus : NSObject

/** string	字符串型的微博ID */
@property(nonatomic,copy) NSString *idstr;

/** string	微博信息内容 */
@property(nonatomic,copy) NSString *text;

/** object	微博作者的用户信息字段 详细 */
@property(nonatomic,strong) WBUser *user;

/** string	微博创建时间 */
@property(nonatomic,copy) NSString *created_at;

/**	string	微博来源 */
@property(nonatomic,copy) NSString *source;

/** 微博配图url。多图时返回多图图片url */
@property(nonatomic,copy) NSArray *pic_urls;

/** 被转发的原微博信息字段，当该微博为转发微博时返回 */
@property(nonatomic,strong) WBStatus *retweeted_status;

/** int	转发数 */
@property(nonatomic,assign) int reposts_count;
/** int	评论数 */
@property(nonatomic,assign) int comments_count;
/** int	表态数 */
@property(nonatomic,assign) int attitudes_count;

//-(NSString *)fullText;
@end
