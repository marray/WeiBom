//
//  WBDropDownMenu.h
//  WeiBoM
//
//  Created by Michael on 10/13/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBDropDownMenu : UIView

/**
 *  创建菜单
 *
 *  @return 返回对象
 */
+(instancetype)menue;
/**
 *  显示菜单
 */
-(void)showFrom:(UIView *)from;

/**
 *  销毁
 */
-(void)dismiss;

@property(nonatomic,strong) UIView *content;

@property(nonatomic,strong) UIViewController *contentController;

@end
