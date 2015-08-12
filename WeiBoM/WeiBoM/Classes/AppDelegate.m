//
//  AppDelegate.m
//  WeiBoM
//
//  Created by Michael on 8/10/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "AppDelegate.h"
#import "WBDiscoverViewController.h"
#import "WBMessageViewController.h"
#import "WBHomeViewController.h"
#import "WBProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabbar=[[UITabBarController alloc] init];
    self.window.rootViewController=tabbar;
    
    WBHomeViewController *home=[[WBHomeViewController alloc] init];
    [self childController:home WithTitle:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    WBMessageViewController *message=[[WBMessageViewController alloc] init];
    [self childController:message WithTitle:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    WBDiscoverViewController *discover=[[WBDiscoverViewController alloc] init];
    [self childController:discover WithTitle:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    WBProfileViewController *profile=[[WBProfileViewController alloc] init];
    [self childController:profile WithTitle:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    [tabbar addChildViewController:home];
    [tabbar addChildViewController:message];
    [tabbar addChildViewController:discover];
    [tabbar addChildViewController:profile];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)childController:(UIViewController *)vControl WithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=WBColor(123, 123, 123);
    NSMutableDictionary *dictSelect=[NSMutableDictionary dictionary];
    dictSelect[NSForegroundColorAttributeName]=[UIColor orangeColor];

    vControl.tabBarItem.title=title;
    vControl.tabBarItem.image=[UIImage imageNamed:image];
    vControl.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vControl.view.backgroundColor=WBRandomColor;
    [vControl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [vControl.tabBarItem setTitleTextAttributes:dictSelect forState:UIControlStateSelected ];

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
