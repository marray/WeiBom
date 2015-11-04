//
//  WBComposePhotosView.m
//  WeiBoM
//
//  Created by Michael on 11/4/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBComposePhotosView.h"

@interface WBComposePhotosView()

@end

@implementation WBComposePhotosView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _photos=[NSMutableArray array];
    }
    return self;
}

-(void)addPhoto:(UIImage *)photo
{
    UIImageView *photoView=[[UIImageView alloc] init];
    photoView.image=photo;
    [self addSubview:photoView];
    [_photos addObject:photo];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.subviews.count;
    CGFloat photoViewWH=70;
    CGFloat photoViewMargin=10;
    
    for (int i=0; i< count; i++) {
        UIImageView *photoView=self.subviews[i];
        photoView.x= i % 4 * (photoViewWH + photoViewMargin);
        photoView.y= i / 4 * (photoViewWH + photoViewMargin);
        photoView.width=photoViewWH;
        photoView.height=photoViewWH;
        
    }
    
}



@end
