//
//  WBStatusFrame.m
//  WeiBoM
//
//  Created by Michael on 10/22/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBStatusFrame.h"
#import "WBStatus.h"
#import "WBUser.h"

#define WBStautsCellBoundsW 10

@implementation WBStatusFrame

-(CGSize)widthWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxw
{
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=font;
    CGSize maxSize={maxw , MAXFLOAT };
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
}

-(CGSize)widthWithText:(NSString *)text font:(UIFont *)font
{
    return [self widthWithText:text font:font maxW:0];
    
}

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
    CGSize nameSize=[self widthWithText:user.name font:WbStatusNameLabelFont];
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
    CGSize timeSize=[self widthWithText:status.created_at font:WbStatusTimeLabelFont];
    self.timeLabelFrame=(CGRect){{timeX,timeY},timeSize};
    
    /** 发布来源 */
    CGFloat sourceX=CGRectGetMaxX(self.timeLabelFrame) + WBStautsCellBoundsW;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[self widthWithText:status.source font:WbStatusTimeLabelFont];
    self.sourceLabelFrame=(CGRect){{sourceX,sourceY},sourceSize};
    
    /** 原创微博正文 */
    CGFloat contentX=iconX;
    CGFloat contentY=MAX(CGRectGetMaxY(self.iconImageFrame), CGRectGetMaxY(self.timeLabelFrame)) + WBStautsCellBoundsW;
    CGFloat maxW=widthScreen- 2 * WBStautsCellBoundsW;
    CGSize contentSize=[self widthWithText:status.text font:WbStatusContentLabelFont maxW:maxW];
    self.contentLabelFrame=(CGRect){{contentX,contentY},contentSize};
    
    /** 原创微博图片 */
    if (status.pic_urls.count) {
        CGFloat contentImageX=contentX;
        CGFloat contentImageY=CGRectGetMaxY(self.contentLabelFrame) + WBStautsCellBoundsW;
        CGFloat contentImageWH=60;
        self.contentImageViewFrame=CGRectMake(contentImageX, contentImageY, contentImageWH, contentImageWH);
    }
    
    /** 原创微博整体 */
    CGFloat originW=widthScreen;
    CGFloat originH=MAX( CGRectGetMaxY(self.contentLabelFrame) , CGRectGetMaxY(self.contentImageViewFrame) ) + WBStautsCellBoundsW;
    self.originalViewFrame=CGRectMake(0, WBStautsCellMargin, originW, originH);
    
    
    CGFloat toolBarY=0;
    WBStatus *retweet=status.retweeted_status;
    if (retweet) {
        
        /** 转发微博正文 */
        CGFloat retweetContentX=WBStautsCellBoundsW;
        CGFloat retweetContentY=WBStautsCellBoundsW;
        CGFloat retweetMaxW=widthScreen - 2 * WBStautsCellBoundsW;
        NSString *content=[NSString stringWithFormat:@"@%@:%@",retweet.user.name,retweet.text];
        CGSize retweetContentSize=[self widthWithText:content font:WbStatusRetweetContentLabelFont maxW:retweetMaxW];
        self.retweetContentLabelFrame=(CGRect){{retweetContentX,retweetContentY},retweetContentSize};
        
        /** 转发微博图片 */
        if (retweet.pic_urls.count) {
            CGFloat retweetContentImageX=retweetContentX;
            CGFloat retweetContentImageY=CGRectGetMaxY(self.retweetContentLabelFrame) + WBStautsCellBoundsW;
            CGFloat retweetContentImageWH=60;
            self.retweetContentImageViewFrame=CGRectMake(retweetContentImageX, retweetContentImageY, retweetContentImageWH, retweetContentImageWH);
        }
        
        /** 转发微博整体 */
        CGFloat retweetY=CGRectGetMaxY(self.originalViewFrame);
        CGFloat retweetW=widthScreen;
        CGFloat retweetH=MAX( CGRectGetMaxY(self.retweetContentLabelFrame) , CGRectGetMaxY(self.retweetContentImageViewFrame) ) + WBStautsCellBoundsW;
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
