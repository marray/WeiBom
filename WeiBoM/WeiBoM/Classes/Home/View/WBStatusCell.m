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
        
        /** 原创微博整体 */
        UIView *originalView=[[UIView alloc] init];
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
        [originalView addSubview:contentLabel];
        self.contentLabel=contentLabel;
        
        /**原创微博图片*/
        UIImageView *contentImageView=[[UIImageView alloc] init];
        [originalView addSubview:contentImageView];
        self.contentImageView=contentImageView;
        
    }
    return self;
}


-(void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame=statusFrame;
    
    WBStatus *status=statusFrame.status;
    WBUser *user=status.user;
    
    /** 原创微博整体 */
    self.originalView.frame=statusFrame.originalViewFrame;
    
    /** 用户头像 */
    self.iconImageView.frame=statusFrame.iconImageFrame;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    /** vip图片 */
    self.vipImageView.frame=statusFrame.vipImageFrame;
    self.vipImageView.image=[UIImage imageNamed:@"common_icon_membership_level1"];
    
    /** 用户昵称 */
    self.nameLabel.frame=statusFrame.nameLabelFrame;
    self.nameLabel.text=user.name;
    
    /** 创建时间 */
    self.timeLabel.frame=statusFrame.timeLabelFrame;
    
    /** 发布来源 */
    self.sourceLabel.frame=statusFrame.sourceLabelFrame;
    
    /** 原创微博正文 */
    self.contentLabel.frame=statusFrame.contentLabelFrame;
    self.contentLabel.text=status.text;
    
    /**原创微博图片*/
    self.contentImageView.frame=statusFrame.contentImageViewFrame;
    
    
}


@end
