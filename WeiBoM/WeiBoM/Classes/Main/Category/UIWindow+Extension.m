//
//  UIWindow+Extension.m
//  WeiBoM
//
//  Created by IceMi on 15/10/18.
//  Copyright © 2015年 agIce. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "WBTabBarViewController.h"
#import "WBNewFeatrueViewController.h"

#define WBVersionKey @"CFBundleVersion"
@implementation UIWindow (Extension)

-(void)changeRootViewController
{
    //上一个版本号（沙盒中）
    NSString *cachVersion=[[NSUserDefaults standardUserDefaults] objectForKey:WBVersionKey];
    //当前版本号
    NSString *currentVersion=[[NSBundle mainBundle] objectForInfoDictionaryKey:WBVersionKey];
    
    if ([cachVersion isEqualToString:currentVersion]) {
        self.rootViewController=[[WBTabBarViewController alloc] init];
    }else{
        self.rootViewController=[[WBNewFeatrueViewController alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:WBVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}
@end
