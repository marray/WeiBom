//
//  WBDropDownMenu.m
//  WeiBoM
//
//  Created by Michael on 10/13/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBDropDownMenu.h"

@interface WBDropDownMenu()
@property(nonatomic,weak) UIImageView *containerView;

@end

@implementation WBDropDownMenu

-(UIImageView *)containerView
{
    if(!_containerView){
        UIImageView *containerView=[[UIImageView alloc] init];
        containerView.image=[UIImage imageNamed:@"popover_background"];
        containerView.width=217;
        containerView.height=217;
        containerView.userInteractionEnabled=YES;
        [self addSubview:containerView];
        self.containerView=containerView;
        
    }
    return _containerView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        //挡板的图片
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

+(instancetype)menue
{
    return [[self alloc] init];
}


-(void)showFrom:(UIView *)from
{
    //保证弹出的界面在最上面
    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    self.frame=window.bounds;
    
    //坐标系转换
    CGRect newFrame=[from convertRect:from.bounds toView:window];
    
    self.containerView.centerX=CGRectGetMidX(newFrame);
    self.containerView.y=CGRectGetMaxY(newFrame);
    
}

-(void)dismiss
{
    [self removeFromSuperview];
}

-(void)setContent:(UIView *)content
{
    _content=content;
    
    content.x=10;
    content.y=15;
    self.containerView.height=CGRectGetMaxY(content.frame)+11;
    self.containerView.width=CGRectGetMaxX(content.frame)+10;
    
    //[_containerView addSubview:_content]出错，懒加载，此时_containerView为空.
    [self.containerView addSubview:_content];
}

-(void)setContentController:(UIViewController *)contentController
{
    _contentController=contentController;
    
    self.content=contentController.view;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
