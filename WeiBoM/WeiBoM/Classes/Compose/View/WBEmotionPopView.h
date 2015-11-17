//
//  WBEmotionPopView.h
//  WeiBoM
//
//  Created by Michael on 11/10/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBEmotion , WBEmotionButton;

@interface WBEmotionPopView : UIView

/**
 * 创建一个popView对象
 */
+(instancetype)popView;

/**
 * 通过一个按钮模型 显示一个popview
 */
-(void)showPopViewWithButton:(WBEmotionButton *)button;

@end
