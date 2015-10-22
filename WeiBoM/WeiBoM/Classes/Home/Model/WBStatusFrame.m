//
//  WBStatusFrame.m
//  WeiBoM
//
//  Created by Michael on 10/22/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBStatusFrame.h"

#define WBStautsCellBoundsW 10

@implementation WBStatusFrame

-(CGSize)widthWithLabel:(NSString *)text font:(UIFont *)font
{
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    
    [text sizeWithAttributes:attr];
    
}

-(void)setStatus:(WBStatus *)status
{
    _status=status;
    
    //计算frame
    
    /** 原创微博整体 */
//    self.originalViewFrame;
    
    /** 用户头像 */
    CGFloat iconWH=50;
    CGFloat iconX=WBStautsCellBoundsW;
    CGFloat iconY=WBStautsCellBoundsW;
    self.iconImageFrame=CGRectMake( iconX, iconY, iconWH, iconWH);
    
    /** 用户昵称 */
    CGFloat nameLabelX=CGRectGetMaxX(self.iconImageFrame) + WBStautsCellBoundsW;
    CGFloat nameLabelY=iconY;
//    CGFloat nameLabelW=;
    CGFloat nameLabelH=20;
    //    self.nameLabelFrame;
    
    
    /** vip图片 */
//    self.vipImageFrame;
    
    
    /** 创建时间 */
//    self.timeLabelFrame;
    
    /** 发布来源 */
//    self.sourceLabelFrame;
    
    /** 原创微博正文 */
//    self.contentLabelFrame;
    
    /**原创微博图片*/
//    self.contentImageViewFrame;
    
    /**cell的高度*/
    self.cellHeigh=70;
    
}


@end
