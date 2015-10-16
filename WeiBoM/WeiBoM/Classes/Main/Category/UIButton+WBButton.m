//
//  UIButton+WBButton.m
//  WeiBoM
//
//  Created by Michael on 10/15/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "UIButton+WBButton.h"

@implementation UIButton (WBButton)

+(UIButton *)buttonWithTarget:(id)target Width:(CGFloat)width height:(CGFloat)height centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(NSString *)image selectImage:(NSString *)selectImage action:(SEL)action
{
    UIButton *button=[[UIButton alloc] init];
    button.width=width;
    button.height=height;
    button.centerX=centerX;
    button.centerY=centerY;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font=font;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


+(UIButton *)buttonWithTarget:(id)target size:(CGSize)size centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title backImage:(NSString *)backImage backHighImage:(NSString *)backHighImage action:(SEL)action
{
    UIButton *button=[[UIButton alloc] init];
    button.size=size;
    button.centerX=centerX;
    button.centerY=centerY;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:backHighImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
