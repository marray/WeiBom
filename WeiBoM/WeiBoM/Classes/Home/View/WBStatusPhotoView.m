//
//  WBStatusPhotoView.m
//  WeiBoM
//
//  Created by Michael on 10/29/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBStatusPhotoView.h"
#import "WBPhoto.h"
#import "UIImageView+WebCache.h"

@interface WBStatusPhotoView()
@property(nonatomic,weak) UIImageView *gitView;
@end

@implementation WBStatusPhotoView

-(UIImageView *)gitView
{
    if (!_gitView) {
        
        UIImage *image=[UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gitView=[[UIImageView alloc] initWithImage:image];
        [self addSubview:gitView];
        _gitView=gitView;
        
    }
    return _gitView;
}


-(void)setPhoto:(WBPhoto *)photo
{
    _photo=photo;
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //显示或隐藏gif图片
    self.gitView.hidden = ![photo.thumbnail_pic.lowercaseString hasSuffix:@"gif"];
    
    //保持原来宽高比拉伸，到宽度（高度）等于imageView为止，再居中，会超出imageView范围，设置clipsToBounds会切掉超出的部分
    self.contentMode=UIViewContentModeScaleAspectFill;
    self.clipsToBounds=YES;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gitView.x=self.width - self.gitView.width;
    self.gitView.y=self.height - self.gitView.height;
}

@end
