
//
//  WBEmotionPageView.m
//  WeiBoM
//
//  Created by Michael on 11/9/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionPageView.h"
#import "WBEmotion.h"
#import "WBEmotionPopView.h"
#import "WBEmotionButton.h"

@interface WBEmotionPageView ()
@property(nonatomic,strong) WBEmotionPopView *popView;

@end

@implementation WBEmotionPageView

-(WBEmotionPopView *)popView
{
    if (!_popView) {
        self.popView=[WBEmotionPopView popView];
    }
    return _popView;
}

-(void)setEmotions:(NSArray *)emotions
{
    _emotions=emotions;
    
    for (int i=0; i< emotions.count; i++) {
        WBEmotionButton *iconBtn=[[WBEmotionButton alloc] init];
        iconBtn.emotion=emotions[i];
        [iconBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iconBtn];
    }
//    UIButton *deleteBtn=[[UIButton alloc] init];
//    [deleteBtn setImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
//    [deleteBtn setImage:[UIImage imageNamed:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
//    [self addSubview:deleteBtn];

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //    添加表情
    CGFloat marginBounds=10;
    CGFloat iconBtnW=(self.width - 2 * marginBounds) / WBEmotionMaxCols;
    CGFloat iconBtnH=(self.height - marginBounds) / WBEmotionMaxRows;
    
    for (int i=0; i< self.emotions.count; i++) {
        WBEmotionButton *iconBtn=self.subviews[i];
        iconBtn.x=i % WBEmotionMaxCols * iconBtnW + marginBounds;
        iconBtn.y=i / WBEmotionMaxCols * iconBtnH + marginBounds;
        iconBtn.width=iconBtnW;
        iconBtn.height=iconBtnH;
    }
//    UIButton *deleteBtn=[self.subviews lastObject];
//    deleteBtn.x=self.width - (iconBtnW + marginBounds);
//    deleteBtn.y=2 * iconBtnH +marginBounds;
//    deleteBtn.width=iconBtnW;
//    deleteBtn.height=iconBtnH;

}

-(void)iconBtnClick:(WBEmotionButton *)button
{
    //添加表情放大界面显示数据源
    self.popView.emotion=button.emotion;
    
    //添加点击表情放大效果
    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self.popView];  //相对于最外层的window的尺寸
    //转换坐标系
    CGRect btnFrame=[button convertRect:button.bounds toView:nil];
    
    //设置表情放大显示位置
    self.popView.centerX=CGRectGetMidX(btnFrame);
    self.popView.y=CGRectGetMidY(btnFrame)-self.popView.height;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.popView removeFromSuperview];
    });
    
    //发出点击按钮的通知
    NSMutableDictionary *useInfo=[NSMutableDictionary dictionary];
    useInfo[emotionSelectedKey]=button.emotion;
    [WBNotificationCenter postNotificationName:WBEmotionButtonDidSelectNotification object:nil userInfo:useInfo];
    
}

@end
