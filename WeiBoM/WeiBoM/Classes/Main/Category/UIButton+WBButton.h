//
//  UIButton+WBButton.h
//  WeiBoM
//
//  Created by Michael on 10/15/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WBButton)
+(UIButton *)buttonWithTarget:(id)target Width:(CGFloat)width height:(CGFloat)height centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(NSString *)image selectImage:(NSString *)selectImage action:(SEL)action;

+(UIButton *)buttonWithTarget:(id)target size:(CGSize)size centerX:(CGFloat)centerX centerY:(CGFloat)centerY title:(NSString *)title backImage:(NSString *)backImage backHighImage:(NSString *)backHighImage action:(SEL)action;
@end
