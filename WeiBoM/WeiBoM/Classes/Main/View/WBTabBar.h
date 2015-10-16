//
//  WBTabBar.h
//  WeiBoM
//
//  Created by Michael on 10/14/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBTabBar;

@protocol WBTabBarDelegate <UITabBarDelegate>

@optional
-(void)tabBarDidPlusClick:(WBTabBar *)tabBar;

@end

@interface WBTabBar : UITabBar
+(instancetype)tabBar;

@property(nonatomic,weak) id<WBTabBarDelegate> delegate;
@end
