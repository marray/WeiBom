// 
// WBTabBarViewController.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 7920269D-D20B-4C59-9CA1-B825992A2198
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBTabBarViewController.h"
#import "WBDiscoverViewController.h"
#import "WBMessageViewController.h"
#import "WBHomeViewController.h"
#import "WBProfileViewController.h"
#import "WBNavigationController.h"
#import "WBTabBar.h"

@interface WBTabBarViewController ()<WBTabBarDelegate>

@end

@implementation WBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WBHomeViewController *home=[[WBHomeViewController alloc] init];
    [self childController:home WithTitle:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    WBMessageViewController *message=[[WBMessageViewController alloc] init];
    [self childController:message WithTitle:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];

    WBDiscoverViewController *discover=[[WBDiscoverViewController alloc] init];
    [self childController:discover WithTitle:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    WBProfileViewController *profile=[[WBProfileViewController alloc] init];
    [self childController:profile WithTitle:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    //KVC
    WBTabBar *wbTabBar=[WBTabBar tabBar];
    [self setValue:wbTabBar forKeyPath:@"tabBar"];
    //替换系统自带的tabBar  ，这行代码过后 tabBar的delegate就是WBTabBarViewController
    //不用再设置  wbTabBar.delegate=self;
    //如果tabBar设置完delegate后，再执行这行代码修改delegate，就会报错
    //不允许修改TabBar的Delegate属性 （这个Tabbar是被WBTabBarViewController所管理的）
    
}


/**
 *  添加一个子控制器
 *
 *  @param vControl      控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中市的图片
 */
-(void)childController:(UIViewController *)vControl WithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
//    vControl.tabBarItem.title=title;   //设置tabBarItem的标题
//    vControl.navigationItem.title=title;  //设置导航栏控制器的标题
    //设置标题
    vControl.title=title;   //相当于上面两句  设置导航栏和tabBarItem的标题
    //设置图片
    vControl.tabBarItem.image=[UIImage imageNamed:image];
    vControl.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    vControl.view.backgroundColor=WBRandomColor;  //调用view属性 导致控制器提前创建了
    
    //设置tabBarItem字体颜色
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=WBColor(123, 123, 123);
    NSMutableDictionary *dictSelect=[NSMutableDictionary dictionary];
    dictSelect[NSForegroundColorAttributeName]=[UIColor orangeColor];
    [vControl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [vControl.tabBarItem setTitleTextAttributes:dictSelect forState:UIControlStateSelected ];
    
    //包装控制器为导航控制器
    WBNavigationController *nav=[[WBNavigationController alloc] initWithRootViewController:vControl];
    [self addChildViewController:nav];
    
}


-(void)tabBarDidPlusClick:(WBTabBar *)tabBar
{
    UIViewController *vc=[[UIViewController alloc] init];
    vc.view.backgroundColor=[UIColor whiteColor];
    [self presentViewController:vc animated:YES completion:nil];
}




@end
