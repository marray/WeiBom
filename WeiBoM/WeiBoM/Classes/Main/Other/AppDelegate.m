// 
// AppDelegate.m
//
// IDECodeSnippetIdentifier: BC4BF60F-9BC3-4FF8-802C-576604AD8595
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "AppDelegate.h"
#import "WBTabBarViewController.h"
#import "WBNewFeatrueViewController.h"

#define WBVersionKey @"CFBundleVersion"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    //上一个版本号（沙盒中）
    NSString *cachVersion=[[NSUserDefaults standardUserDefaults] objectForKey:WBVersionKey];
    //当前版本号
    NSString *currentVersion=[[NSBundle mainBundle] objectForInfoDictionaryKey:WBVersionKey];
    
    if ([cachVersion isEqualToString:currentVersion]) {
            self.window.rootViewController=[[WBTabBarViewController alloc] init];
    }else{
        self.window.rootViewController=[[WBNewFeatrueViewController alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:WBVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.window makeKeyAndVisible];
    return YES;
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
