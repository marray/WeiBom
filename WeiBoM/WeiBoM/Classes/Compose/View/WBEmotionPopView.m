//
//  WBEmotionPopView.m
//  WeiBoM
//
//  Created by Michael on 11/10/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionPopView.h"
#import "WBEmotionButton.h"

@interface WBEmotionPopView()
@property (weak, nonatomic) IBOutlet WBEmotionButton *emotionButton;

@end
@implementation WBEmotionPopView

+(instancetype)popView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WBEmotionPopView" owner:nil options:nil] lastObject];
}


-(void)showPopViewWithButton:(WBEmotionButton *)button
{
    if (button == nil) return;
        
    //添加表情放大界面显示数据源
    self.emotionButton.emotion=button.emotion;
    
    //添加点击表情放大效果
    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];  //相对于最外层的window的尺寸
    //转换坐标系
    CGRect btnFrame=[button convertRect:button.bounds toView:nil];
    
    //设置表情放大显示位置
    self.centerX=CGRectGetMidX(btnFrame);
    self.y=CGRectGetMidY(btnFrame)-self.height;
}


@end
