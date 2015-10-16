//
//  WBDropDownMenu.h
//  WeiBoM
//
//  Created by Michael on 10/13/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBDropDownMenu;
@protocol WBDropDownMenuDelegate <NSObject>
@optional
-(void)dropDownMenuDidDismiss:(WBDropDownMenu *)menu;
-(void)dropDownMenuDidShow:(WBDropDownMenu *)menu;
@end

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

@property(nonatomic,weak) id<WBDropDownMenuDelegate> delegate;

@end
