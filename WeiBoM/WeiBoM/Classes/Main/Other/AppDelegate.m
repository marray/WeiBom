// 
// AppDelegate.m
//
// IDECodeSnippetIdentifier: BC4BF60F-9BC3-4FF8-802C-576604AD8595
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "AppDelegate.h"
#import "WBOAthuViewController.h"
#import "WBAccountManager.h"
#import "SDWebImageManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //用户通知设置  针对8.0以后的系统
    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
    if (sysVersion>=8.0) {
        UIUserNotificationType type=UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
    }

    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //从沙盒中获取用户信息
    WBAccount *account=[WBAccountManager account];
    
    if(account){
        [self.window changeRootViewController];
        
    }else{
        self.window.rootViewController=[[WBOAthuViewController alloc] init];
    }
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //想操作系统申请后台运行的资格，能维持多久，是不确定的
    UIBackgroundTaskIdentifier task=[application beginBackgroundTaskWithExpirationHandler:^{
        
        //当申请的后台运行时间已经结束（过期），就会调用这个blok
        
        //赶紧结束任务
        [application endBackgroundTask:task];
        
    }];
    
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

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    SDWebImageManager *mgr=[SDWebImageManager sharedManager];
    //取消下载
    [mgr cancelAll];
    
    //清掉所有图片缓存
    [mgr.imageCache clearMemory];
}

@end
