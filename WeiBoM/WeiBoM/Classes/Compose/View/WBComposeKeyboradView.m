//
//  WBComposeKeyboradView.m
//  WeiBoM
//
//  Created by Michael on 11/5/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBComposeKeyboradView.h"
#import "WBEmotionListView.h"
#import "WBEmotionTabBar.h"
#import "WBEmotion.h"
#import "MJExtension.h"
#import "WBEmotionTool.h"

@interface WBComposeKeyboradView ()<WBEmotionTabBarDelegate>
/**表情键盘上层内容*/
@property(nonatomic,weak) UIView *contentView;
/**表情界面*/
@property(nonatomic,strong) WBEmotionListView *recentListView;
@property(nonatomic,strong) WBEmotionListView *defaultListView;
@property(nonatomic,strong) WBEmotionListView *emojiListView;
@property(nonatomic,strong) WBEmotionListView *lxhListView;
/**tabBar*/
@property(nonatomic,weak) WBEmotionTabBar *tabBar;
@end

@implementation WBComposeKeyboradView

//-(WBEmotionListView *)recentListView
//{
//    if (!_recentListView) {
//        self.recentListView=[[WBEmotionListView alloc] init];
//        self.recentListView.emotions=[WBEmotionTool recentEmotion];
//    }
//    return _recentListView;
//}

-(WBEmotionListView *)defaultListView
{
    if (!_defaultListView) {
        self.defaultListView=[[WBEmotionListView alloc] init];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        NSArray *defaultEmotion=[WBEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.defaultListView.emotions=defaultEmotion;
    }
    return _defaultListView;
}

-(WBEmotionListView *)emojiListView
{
    if (!_emojiListView) {
        self.emojiListView=[[WBEmotionListView alloc] init];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        NSArray *emojiEmotion=[WBEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.emojiListView.emotions=emojiEmotion;
    }
    return _emojiListView;
}

-(WBEmotionListView *)lxhListView
{
    if (!_lxhListView) {
        self.lxhListView=[[WBEmotionListView alloc] init];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        NSArray *lxhEmotion=[WBEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.lxhListView.emotions=lxhEmotion;
    }
    return _lxhListView;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        // 1.表情界面
        UIView *contentView=[[UIView alloc] init];
        [self addSubview:contentView];
        self.contentView=contentView;
        
        // 2.tabBar工具栏
        WBEmotionTabBar *tabBar=[[WBEmotionTabBar alloc] init];
        tabBar.delegate=self;
        [self addSubview:tabBar];
        self.tabBar=tabBar;
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //tabBar工具栏
    self.tabBar.width=self.width;
    self.tabBar.height=37;
    self.tabBar.x=0;
    self.tabBar.y=self.height - self.tabBar.height;
    
    //上层界面内容
    self.contentView.width=self.width;
    self.contentView.height=self.tabBar.y;
    self.contentView.x=self.contentView.y=0;
    
    //表情界面
    WBEmotionListView *childView=[self.contentView.subviews lastObject];
    childView.frame=self.contentView.bounds;
    
}

#pragma  mark -WBEmotionTabBarDelegate
-(void)emotionTabBar:(WBEmotionTabBar *)tabBar withButtonType:(WBEmotionTabBarButtonType)buttonType
{
    //移除之前添加进来的页面
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //添加要显示的界面
    switch (buttonType) {
        case WBEmotionTabBarButtonTypeRecent:  //最近
            self.recentListView=[[WBEmotionListView alloc] init];
            self.recentListView.emotions=[WBEmotionTool recentEmotion];
            [self.contentView addSubview:self.recentListView];
            break;
        case WBEmotionTabBarButtonTypeDefault:  //默认
            [self.contentView addSubview:self.defaultListView];
            
            break;
        case WBEmotionTabBarButtonTypeEmoji:  //Emoji
            [self.contentView addSubview:self.emojiListView];
            
            break;
        case WBEmotionTabBarButtonTypeLxh:  //浪小花
            [self.contentView addSubview:self.lxhListView];
            
            break;
    }
    //调用这个方法会执行layoutSubviews
    [self setNeedsLayout];
}


@end
