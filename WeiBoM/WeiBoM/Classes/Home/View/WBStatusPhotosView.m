//
//  WBStatusPhotosView.m
//  WeiBoM
//
//  Created by Michael on 10/28/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBStatusPhotosView.h"
#import "WBPhoto.h"
#import "UIImageView+WebCache.h"
#import "WBStatusPhotoView.h"

#define WBStatusPhotosWH 70
#define WBStatusPhotosB 10
#define WBStatusPhotosMaxCol(count) (count==4)? 2 : 3

@implementation WBStatusPhotosView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)setPhotos:(NSArray *)photos
{
    _photos=photos;
    
    NSUInteger count=photos.count;
    
    //一次性创建出所有控件
    while (self.subviews.count < count) {
        WBStatusPhotoView *photosView=[[WBStatusPhotoView alloc] init];
        [self addSubview:photosView];
    }
    //不使用的控件不显示
    for (int i=0; i< self.subviews.count; i++) {
        WBStatusPhotoView *photoView=self.subviews[i];
        if (i < count) {
            photoView.hidden=NO;
            
            photoView.photo=photos[i];
        }else{
            photoView.hidden=YES;
        }
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.photos.count;
    
    for (int i=0; i< count; i++) {
        WBStatusPhotoView *photo=self.subviews[i];
        int maxCol=WBStatusPhotosMaxCol(count);
        photo.x= i % maxCol * (WBStatusPhotosWH + WBStatusPhotosB);
        photo.y= i / maxCol * (WBStatusPhotosWH + WBStatusPhotosB);
        photo.width=WBStatusPhotosWH;
        photo.height=WBStatusPhotosWH;
    }
    
}

/**
 *  根据图片数计算总体的尺寸
 *
 *  @param count 图片数目
 *
 *  @return 返回尺寸
 */
+(CGSize)sizeWithCount:(int)count
{
    int maxCol=WBStatusPhotosMaxCol(count);
    //列数
    int col=count >= maxCol ? maxCol : count;
    //行数
    int row=(count + maxCol - 1) / maxCol;  //行数（页数）计算规律
    
    CGFloat photosH=row * WBStatusPhotosWH + (row - 1) * WBStatusPhotosB;
    CGFloat photosW=col * WBStatusPhotosWH + (col - 1) * WBStatusPhotosB;
    
    return (CGSize){photosW,photosH};
}

@end
