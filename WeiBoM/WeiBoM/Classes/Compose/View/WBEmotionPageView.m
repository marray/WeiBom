
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
#import "WBEmotionTool.h"

@interface WBEmotionPageView ()
@property(nonatomic,strong) WBEmotionPopView *popView;
@property(nonatomic,weak) UIButton *deleteBtn;
@end

@implementation WBEmotionPageView

-(WBEmotionPopView *)popView
{
    if (!_popView) {
        self.popView=[WBEmotionPopView popView];
    }
    return _popView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UIButton *deleteBtn=[[UIButton alloc] init];
        [deleteBtn setImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
        [deleteBtn setImage:[UIImage imageNamed:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
        [deleteBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleteBtn];
        self.deleteBtn=deleteBtn;
        
        [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)]];
    }
    return self;
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

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //    添加表情
    CGFloat marginBounds=10;
    CGFloat iconBtnW=(self.width - 2 * marginBounds) / WBEmotionMaxCols;
    CGFloat iconBtnH=(self.height - marginBounds) / WBEmotionMaxRows;
    
    for (int i=0; i< self.emotions.count; i++) {
        WBEmotionButton *iconBtn=self.subviews[i + 1];
        iconBtn.x=i % WBEmotionMaxCols * iconBtnW + marginBounds;
        iconBtn.y=i / WBEmotionMaxCols * iconBtnH + marginBounds;
        iconBtn.width=iconBtnW;
        iconBtn.height=iconBtnH;
    }
    self.deleteBtn.x=self.width - (iconBtnW + marginBounds);
    self.deleteBtn.y=2 * iconBtnH +marginBounds;
    self.deleteBtn.width=iconBtnW;
    self.deleteBtn.height=iconBtnH;

}

/**
 * 根据手势位置获取按钮
 */
-(WBEmotionButton *)buttonWithRecognizeLocation:(CGPoint)location
{
    for (int i=0; i< self.emotions.count; i++) {
        WBEmotionButton *iconBtn=self.subviews[i + 1];
        if (CGRectContainsPoint(iconBtn.frame, location)) {
            return iconBtn;
        }
    }
    return nil;
}

-(void)longPressGesture:(UIGestureRecognizer *)recognizer
{
    //获取手势位置
    CGPoint location=[recognizer locationInView:recognizer.view];
    //获取手势位置所在按钮
    WBEmotionButton *button=[self buttonWithRecognizeLocation:location];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateChanged:
            //显示popView
            [self.popView showPopViewWithButton:button];
            
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            //手指松开后从界面上移除popView
            [self.popView removeFromSuperview];
            
            if (button) {
                //发出点击通知
                [self postNotificationWithEmotion:button.emotion];
            }
        }
            break;
            
        default:
            break;
    }
    
}

/**监听删除按钮点击*/
-(void)deleteClick
{
    [WBNotificationCenter postNotificationName:WBEmotionButtonDidDeleteNotification object:nil];
}

-(void)iconBtnClick:(WBEmotionButton *)button
{
    //显示popView
    [self.popView showPopViewWithButton:button];
    
    //延迟一段时间移除popview
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.popView removeFromSuperview];
    });
    
    //发出点击按钮的通知
    [self postNotificationWithEmotion:button.emotion];
    
}

/**
 * 拿到表情模型 发出通知
 */
-(void)postNotificationWithEmotion:(WBEmotion *)emotion
{
    //点击的按钮存入沙盒 为最近使用的表情
    [WBEmotionTool saveRecentEmotion:emotion];
    
    //发出点击按钮的通知
    NSMutableDictionary *useInfo=[NSMutableDictionary dictionary];
    useInfo[emotionSelectedKey]=emotion;
    [WBNotificationCenter postNotificationName:WBEmotionButtonDidSelectNotification object:nil userInfo:useInfo];
}

@end
