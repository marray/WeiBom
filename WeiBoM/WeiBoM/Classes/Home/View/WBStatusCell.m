//
//  WBStatusCell.m
//  WeiBoM
//
//  Created by Michael on 10/22/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "WBStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "WBPhoto.h"
#import "WBStatusToolBar.h"
#import "WBStatusPhotosView.h"

@interface WBStatusCell()

/** 原创微博整体 */
@property(nonatomic,weak) UIView *originalView;

/** 用户头像 */
@property(nonatomic,weak)  UIImageView *iconImageView;

/** vip图片 */
@property(nonatomic,weak)  UIImageView *vipImageView;

/** 用户昵称 */
@property(nonatomic,weak) UILabel *nameLabel;

/** 创建时间 */
@property(nonatomic,weak) UILabel *timeLabel;

/** 发布来源 */
@property(nonatomic,weak) UILabel *sourceLabel;

/** 原创微博正文 */
@property(nonatomic,weak) UILabel *contentLabel;

/**原创微博图片*/
@property(nonatomic,weak)  WBStatusPhotosView *contentPhotosView;


/** 转发微博整体 */
@property(nonatomic,weak) UIView *retweetView;

/** 转发微博正文 + 昵称 */
@property(nonatomic,weak) UILabel *retweetContentLabel;

/** 转发微博图片 */
@property(nonatomic,weak)  WBStatusPhotosView *retweetContentPhotosView;

/** 工具条 */
@property(nonatomic,weak) WBStatusToolBar *toolBarView;

@end

@implementation WBStatusCell

+(instancetype)cellwithTableView:(UITableView *)tableView
{
    static NSString *ID=@"cell";
    WBStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[WBStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //初始化cell的内容
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellAccessoryNone;
        
        //原创微博模型初始化
        [self setupOrigin];
        
        //转发微博模型初始化
        [self setupRetweet];
        
        //工具条初始化
        [self setupToolBar];
        
    }
    return self;
}

/**
 *  工具条初始化
 */
-(void)setupToolBar
{
    /** 工具条 */
    WBStatusToolBar *toolBarView=[WBStatusToolBar toolbar];
    [self.contentView addSubview:toolBarView];
    self.toolBarView=toolBarView;
}

/**
 *  转发微博模型初始化
 */
-(void)setupRetweet
{
    /** 转发微博整体 */
    UIView *retweetView=[[UIView alloc] init];
    [self.contentView addSubview:retweetView];
    retweetView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_retweet_background"]];
    self.retweetView=retweetView;
    
    /** 转发微博正文 + 昵称 */
    UILabel *retweetContentLabel=[[UILabel alloc] init];
    retweetContentLabel.numberOfLines=0;
    retweetContentLabel.font=WbStatusRetweetContentLabelFont;
    [retweetView addSubview:retweetContentLabel];
    self.retweetContentLabel=retweetContentLabel;
    
    /** 转发微博图片 */
    WBStatusPhotosView *retweetContentPhotosView=[[WBStatusPhotosView alloc] init];
    [retweetView addSubview:retweetContentPhotosView];
    self.retweetContentPhotosView=retweetContentPhotosView;
    
}

/**
 *  原创微博模型初始化
 */
-(void)setupOrigin
{
    /** 原创微博整体 */
    UIView *originalView=[[UIView alloc] init];
    originalView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:originalView];
    self.originalView=originalView;
    
    /** 用户头像 */
    UIImageView *iconImageView=[[UIImageView alloc] init];
    [originalView addSubview:iconImageView];
    self.iconImageView=iconImageView;
    
    /** vip图片 */
    UIImageView *vipImageView=[[UIImageView alloc] init];
    [originalView addSubview:vipImageView];
    self.vipImageView=vipImageView;
    
    /** 用户昵称 */
    UILabel *nameLabel=[[UILabel alloc] init];
    nameLabel.font=WbStatusNameLabelFont;
    [originalView addSubview:nameLabel];
    self.nameLabel=nameLabel;
    
    /** 创建时间 */
    UILabel *timeLabel=[[UILabel alloc] init];
    timeLabel.textColor=[UIColor orangeColor];
    timeLabel.font=WbStatusTimeLabelFont;
    [originalView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    
    /** 发布来源 */
    UILabel *sourceLabel=[[UILabel alloc] init];
    sourceLabel.textColor=WBColor(137, 137, 137);
    sourceLabel.font=WbStatusSourceLabelFont;
    [originalView addSubview:sourceLabel];
    self.sourceLabel=sourceLabel;
    
    /** 原创微博正文 */
    UILabel *contentLabel=[[UILabel alloc] init];
    contentLabel.numberOfLines=0;
    contentLabel.font=WbStatusContentLabelFont;
    [originalView addSubview:contentLabel];
    self.contentLabel=contentLabel;
    
    /**原创微博图片*/
    WBStatusPhotosView *contentPhotosView=[[WBStatusPhotosView alloc] init];
    [originalView addSubview:contentPhotosView];
    self.contentPhotosView=contentPhotosView;
}


-(void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame=statusFrame;
    
    /** 原创微博 */
    WBStatus *status=statusFrame.status;
    WBUser *user=status.user;
    
    /** 原创微博整体 */
    self.originalView.frame=statusFrame.originalViewFrame;
    
    /** 用户头像 */
    self.iconImageView.frame=statusFrame.iconImageFrame;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    /** vip图片 */
    
    if (user.vip) {
        self.vipImageView.hidden=NO;
        
        self.vipImageView.frame=statusFrame.vipImageFrame;
        NSString *imageStr=[NSString stringWithFormat:@"common_icon_membership_level%d",user.mbrank];
        self.vipImageView.image=[UIImage imageNamed:imageStr];
        
        self.vipImageView.contentMode=UIViewContentModeCenter;
        self.nameLabel.textColor=[UIColor orangeColor];
    }else{
        self.vipImageView.hidden=YES;
        self.nameLabel.textColor=[UIColor blackColor];
    }
    
    /** 用户昵称 */
    self.nameLabel.frame=statusFrame.nameLabelFrame;
    self.nameLabel.text=user.name;
    
    /** 创建时间 */
    NSString *time=status.created_at;
    CGFloat timeX=statusFrame.nameLabelFrame.origin.x;
    CGFloat timeY=CGRectGetMaxY(statusFrame.nameLabelFrame) + WBStautsCellBoundsW;
    CGSize timeSize=[time widthWithFont:WbStatusTimeLabelFont];
    self.timeLabel.frame=(CGRect){{timeX,timeY},timeSize};
    self.timeLabel.text=time;
    
    /** 发布来源 */
    CGFloat sourceX=CGRectGetMaxX(self.timeLabel.frame) + WBStautsCellBoundsW;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[status.source widthWithFont:WbStatusTimeLabelFont];
    self.sourceLabel.frame=(CGRect){{sourceX,sourceY},sourceSize};
    self.sourceLabel.text=status.source;
    
    /** 原创微博正文 */
    self.contentLabel.frame=statusFrame.contentLabelFrame;
    self.contentLabel.text=status.text;
    
    /**原创微博图片*/
    if (status.pic_urls.count) {
        self.contentPhotosView.hidden=NO;
        
        self.contentPhotosView.frame=statusFrame.contentPhotosViewFrame;
        WBPhoto *photo=[status.pic_urls firstObject];
#warning 设置图片
//        [self.contentPhotosView sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }else{
        self.contentPhotosView.hidden=YES;
    }
    
    
    /** 转发微博 */
    WBStatus *retweet=status.retweeted_status;
    if (retweet) {
        
        /** 转发微博整体 */
        self.retweetView.frame=statusFrame.retweetViewFrame;
        self.retweetView.hidden=NO;
        
        /** 转发微博正文 + 昵称 */
        self.retweetContentLabel.frame=statusFrame.retweetContentLabelFrame;
        NSString *content=[NSString stringWithFormat:@"@%@:%@",retweet.user.name,retweet.text];
        self.retweetContentLabel.text=content;
        
        /** 转发微博图片 */
        if (retweet.pic_urls.count) {
            self.retweetContentPhotosView.hidden=NO;
            
            self.retweetContentPhotosView.frame=statusFrame.retweetContentPhotosViewFrame;
            WBPhoto *photo=[retweet.pic_urls firstObject];  //这里只取了一张图片
//            [self.retweetContentPhotosView sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        }else{
            self.retweetContentPhotosView.hidden=YES;
        }
        
    }else{
        self.retweetView.hidden=YES;
    }
    
    /**工具条*/
    self.toolBarView.frame=statusFrame.toolBarViewFrame;
    self.toolBarView.status=status;  //设置工具条
    
}


@end
