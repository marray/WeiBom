//
//  WBIconView.m
//  WeiBoM
//
//  Created by Michael on 10/29/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBIconView.h"
#import "UIImageView+WebCache.h"
#import "WBUser.h"

@interface WBIconView()
@property(nonatomic,weak) UIImageView *verifyView;
@end

@implementation WBIconView

-(UIImageView *)verifyView
{
    if (!_verifyView) {
        UIImageView *verifyView=[[UIImageView alloc] init];
        [self addSubview:verifyView];
        _verifyView=verifyView;
    }
    return _verifyView;
}


-(void)setUser:(WBUser *)user
{
    _user=user;
    
    [self sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    switch (user.verified_type) {
        case WBUserVerifiedPersonal:  // 个人认证
            self.verifyView.hidden=NO;
            self.verifyView.image=[UIImage imageNamed:@"avatar_vip"];
            
            break;
            
        case WBUserVerifiedOrgEnterprice:  // 企业官方：CSDN、EOE、搜狐新闻客户端
        case WBUserVerifiedOrgMedia:       // 媒体官方：程序员杂志、苹果汇
        case WBUserVerifiedOrgWebsite:     // 网站官方：猫扑
            self.verifyView.hidden=NO;
            self.verifyView.image=[UIImage imageNamed:@"avatar_enterprise_vip"];
            
            break;
            
        case WBUserVerifiedDaren:   // 微博达人
            self.verifyView.hidden=NO;
            self.verifyView.image=[UIImage imageNamed:@"avatar_grassroot"];
            
            break;
            
        default: // 没有任何认证
            self.verifyView.hidden=YES;
            break;
    }
    
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat scale=0.6;
    
    self.verifyView.size=self.verifyView.image.size;
    self.verifyView.x=self.width - self.verifyView.width * scale;
    self.verifyView.y=self.height - self.verifyView.height * scale;
    
}

@end
