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
@property(nonatomic,weak)  UIImageView *contentImageView;


/** 转发微博整体 */
@property(nonatomic,weak) UIView *retweetView;

/** 转发微博正文 + 昵称 */
@property(nonatomic,weak) UILabel *retweetContentLabel;

/** 转发微博图片 */
@property(nonatomic,weak)  UIImageView *retweetContentImageView;

/** 工具条 */
@property(nonatomic,weak) UIView *toolBarView;

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
    UIView *toolBarView=[[UIView alloc] init];
    [self.contentView addSubview:toolBarView];
    toolBarView.backgroundColor=[UIColor lightGrayColor];
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
    [retweetView addSubview:retweetContentLabel];
    self.retweetContentLabel=retweetContentLabel;
    
    /** 转发微博图片 */
    UIImageView *retweetContentImageView=[[UIImageView alloc] init];
    [retweetView addSubview:retweetContentImageView];
    self.retweetContentImageView=retweetContentImageView;
    
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
    [originalView addSubview:nameLabel];
    self.nameLabel=nameLabel;
    
    /** 创建时间 */
    UILabel *timeLabel=[[UILabel alloc] init];
    [originalView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    
    /** 发布来源 */
    UILabel *sourceLabel=[[UILabel alloc] init];
    [originalView addSubview:sourceLabel];
    self.sourceLabel=sourceLabel;
    
    /** 原创微博正文 */
    UILabel *contentLabel=[[UILabel alloc] init];
    contentLabel.numberOfLines=0;
    [originalView addSubview:contentLabel];
    self.contentLabel=contentLabel;
    
    /**原创微博图片*/
    UIImageView *contentImageView=[[UIImageView alloc] init];
    [originalView addSubview:contentImageView];
    self.contentImageView=contentImageView;
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
    self.nameLabel.font=WbStatusNameLabelFont;
    self.nameLabel.text=user.name;
    
    /** 创建时间 */
    self.timeLabel.frame=statusFrame.timeLabelFrame;
    self.timeLabel.font=WbStatusTimeLabelFont;
    self.timeLabel.text=status.created_at;
    
    /** 发布来源 */
    self.sourceLabel.frame=statusFrame.sourceLabelFrame;
    self.sourceLabel.font=WbStatusSourceLabelFont;
    self.sourceLabel.text=status.source;
    
    /** 原创微博正文 */
    self.contentLabel.frame=statusFrame.contentLabelFrame;
    self.contentLabel.font=WbStatusContentLabelFont;
    self.contentLabel.text=status.text;
    
    /**原创微博图片*/
    if (status.pic_urls.count) {
        self.contentImageView.hidden=NO;
        
        self.contentImageView.frame=statusFrame.contentImageViewFrame;
        WBPhoto *photo=[status.pic_urls firstObject];
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }else{
        self.contentImageView.hidden=YES;
    }
    
    
    /** 转发微博 */
    WBStatus *retweet=status.retweeted_status;
    if (retweet) {
        
        /** 转发微博整体 */
        self.retweetView.frame=statusFrame.retweetViewFrame;
        self.retweetView.hidden=NO;
        
        /** 转发微博正文 + 昵称 */
        self.retweetContentLabel.frame=statusFrame.retweetContentLabelFrame;
        self.retweetContentLabel.font=WbStatusRetweetContentLabelFont;
        NSString *content=[NSString stringWithFormat:@"@%@:%@",retweet.user.name,retweet.text];
        self.retweetContentLabel.text=content;
        
        /** 转发微博图片 */
        if (retweet.pic_urls.count) {
            self.retweetContentImageView.hidden=NO;
            
            self.retweetContentImageView.frame=statusFrame.retweetContentImageViewFrame;
            WBPhoto *photo=[retweet.pic_urls firstObject];
            [self.retweetContentImageView sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        }else{
            self.retweetContentImageView.hidden=YES;
        }
        
    }else{
        self.retweetView.hidden=YES;
    }
    
    /**工具条*/
    self.toolBarView.frame=statusFrame.toolBarViewFrame;
    
}


@end
