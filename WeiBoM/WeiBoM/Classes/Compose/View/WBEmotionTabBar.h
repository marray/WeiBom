//
//  WBEmotionTabBar.h
//  WeiBoM
//
//  Created by Michael on 11/5/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBEmotionTabBar;

typedef enum {
    WBEmotionTabBarButtonTypeRecent, //最近
    WBEmotionTabBarButtonTypeDefault, //默认
    WBEmotionTabBarButtonTypeEmoji,  //Emoji
    WBEmotionTabBarButtonTypeLxh  //浪小花
}WBEmotionTabBarButtonType;

@protocol WBEmotionTabBarDelegate <NSObject>

@optional
-(void)emotionTabBar:(WBEmotionTabBar *)tabBar withButtonType:(WBEmotionTabBarButtonType)buttonType;
@end

@interface WBEmotionTabBar : UIView
@property(nonatomic,weak) id<WBEmotionTabBarDelegate> delegate;
@end
