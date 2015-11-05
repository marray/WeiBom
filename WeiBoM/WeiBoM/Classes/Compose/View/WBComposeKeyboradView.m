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

@interface WBComposeKeyboradView ()<WBEmotionTabBarDelegate>
/**表情界面*/
@property(nonatomic,weak) WBEmotionListView *listView;
/**tabBar*/
@property(nonatomic,weak) WBEmotionTabBar *tabBar;
@end

@implementation WBComposeKeyboradView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        // 1.表情界面
        WBEmotionListView *listView=[[WBEmotionListView alloc] init];
        [self addSubview:listView];
        self.listView=listView;
        
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
    
    //表情界面
    self.listView.width=self.width;
    self.listView.height=self.tabBar.y;
    self.listView.x=self.listView.y=0;
    
}

-(void)emotionTabBar:(WBEmotionTabBar *)tabBar withButtonType:(WBEmotionTabBarButtonType)buttonType
{
    switch (buttonType) {
        case WBEmotionTabBarButtonTypeRecent:  //最近
            WBLOG(@"最近");
            break;
        case WBEmotionTabBarButtonTypeDefault:  //默认
            WBLOG(@"默认");
            break;
        case WBEmotionTabBarButtonTypeEmoji:  //Emoji
            WBLOG(@"Emoji");
            break;
        case WBEmotionTabBarButtonTypeLxh:  //浪小花
            WBLOG(@"浪小花");
            break;
    }
}


@end
