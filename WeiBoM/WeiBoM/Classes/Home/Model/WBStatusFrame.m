// 
// WBStatusFrame.m
//
// IDECodeSnippetIdentifier: 0FEE743E-DE2C-4295-A47E-FD24CC6D701B
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBStatusFrame.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "WBStatusPhotosView.h"

@implementation WBStatusFrame


-(void)setStatus:(WBStatus *)status
{
    _status=status;
    
    WBUser *user=status.user;
    
    CGFloat widthScreen=[UIScreen mainScreen].bounds.size.width;
    
    /** 计算frame */
    /** 用户头像 */
    CGFloat iconWH=35;
    CGFloat iconX=WBStautsCellBoundsW;
    CGFloat iconY=WBStautsCellBoundsW;
    self.iconImageFrame=CGRectMake( iconX, iconY, iconWH, iconWH);
    
    /** 用户昵称 */
    CGFloat nameX=CGRectGetMaxX(self.iconImageFrame) + WBStautsCellBoundsW;
    CGFloat nameY=iconY;
    CGSize nameSize=[user.name widthWithFont:WbStatusNameLabelFont];
    self.nameLabelFrame=(CGRect){{nameX,nameY},nameSize};
    
    /** vip图片 */
    if (user.vip) {
        CGFloat vipX=CGRectGetMaxX(self.nameLabelFrame) + WBStautsCellBoundsW;
        CGFloat vipY=nameY;
        CGFloat vipW=13;
        CGFloat vipH=nameSize.height;
        self.vipImageFrame=CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 创建时间 */
    CGFloat timeX=nameX;
    CGFloat timeY=CGRectGetMaxY(self.nameLabelFrame) + WBStautsCellBoundsW;
    CGSize timeSize=[status.created_at widthWithFont:WbStatusTimeLabelFont];
    self.timeLabelFrame=(CGRect){{timeX,timeY},timeSize};
    
    /** 发布来源 */
    CGFloat sourceX=CGRectGetMaxX(self.timeLabelFrame) + WBStautsCellBoundsW;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[status.source widthWithFont:WbStatusTimeLabelFont];
    self.sourceLabelFrame=(CGRect){{sourceX,sourceY},sourceSize};
    
    /** 原创微博正文 */
    CGFloat contentX=iconX;
    CGFloat contentY=MAX(CGRectGetMaxY(self.iconImageFrame), CGRectGetMaxY(self.timeLabelFrame)) + WBStautsCellBoundsW;
    CGFloat maxW=widthScreen- 2 * WBStautsCellBoundsW;
    CGSize contentSize=[status.text widthWithFont:WbStatusContentLabelFont maxW:maxW];
    self.contentLabelFrame=(CGRect){{contentX,contentY},contentSize};
    
    /** 原创微博图片 */
    if (status.pic_urls.count) {
        CGFloat contentPhotosX=contentX;
        CGFloat contentPhotosY=CGRectGetMaxY(self.contentLabelFrame) + WBStautsCellBoundsW;
        CGSize contentPhotosSize=[WBStatusPhotosView sizeWithCount:status.pic_urls.count];
        self.contentPhotosViewFrame=(CGRect){{contentPhotosX, contentPhotosY}, contentPhotosSize};
    }
    
    /** 原创微博整体 */
    CGFloat originW=widthScreen;
    CGFloat originH=MAX( CGRectGetMaxY(self.contentLabelFrame) , CGRectGetMaxY(self.contentPhotosViewFrame) ) + WBStautsCellBoundsW;
    self.originalViewFrame=CGRectMake(0, WBStautsCellMargin, originW, originH);
    
    
    CGFloat toolBarY=0;
    WBStatus *retweet=status.retweeted_status;
    if (retweet) {
        
        /** 转发微博正文 */
        CGFloat retweetContentX=WBStautsCellBoundsW;
        CGFloat retweetContentY=WBStautsCellBoundsW;
        CGFloat retweetMaxW=widthScreen - 2 * WBStautsCellBoundsW;
        NSString *content=[NSString stringWithFormat:@"@%@:%@",retweet.user.name,retweet.text];
        CGSize retweetContentSize=[content widthWithFont:WbStatusRetweetContentLabelFont maxW:retweetMaxW];
        self.retweetContentLabelFrame=(CGRect){{retweetContentX,retweetContentY},retweetContentSize};
        
        /** 转发微博图片 */
        if (retweet.pic_urls.count) {
            CGFloat retweetContentPhotosX=retweetContentX;
            CGFloat retweetContentPhotosY=CGRectGetMaxY(self.retweetContentLabelFrame) + WBStautsCellBoundsW;
            CGSize retweetContentPhotosSize=[WBStatusPhotosView sizeWithCount:retweet.pic_urls.count];
            self.retweetContentPhotosViewFrame=(CGRect){{retweetContentPhotosX, retweetContentPhotosY}, retweetContentPhotosSize};
        }
        
        /** 转发微博整体 */
        CGFloat retweetY=CGRectGetMaxY(self.originalViewFrame);
        CGFloat retweetW=widthScreen;
        CGFloat retweetH=MAX( CGRectGetMaxY(self.retweetContentLabelFrame) , CGRectGetMaxY(self.retweetContentPhotosViewFrame) ) + WBStautsCellBoundsW;
        self.retweetViewFrame=CGRectMake(0, retweetY, retweetW, retweetH);
        
        toolBarY=CGRectGetMaxY(self.retweetViewFrame);
    }else{
        toolBarY=CGRectGetMaxY(self.originalViewFrame);
    }
    
    /** 工具条 */
    CGFloat toolBarW=widthScreen;
    CGFloat toolBarH=35;
    self.toolBarViewFrame=CGRectMake(0, toolBarY, toolBarW, toolBarH);
    
    /**cell的高度*/
    self.cellHeigh=CGRectGetMaxY(self.toolBarViewFrame);
}


@end
