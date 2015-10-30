// 
// WBNavigationController.m
//
// IDECodeSnippetIdentifier: 2399BE09-32AC-4C9D-A0A9-004B61A4E9F4
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBNavigationController.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController

+ (void)initialize
{
    //设置导航栏按钮主题
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    
    NSMutableDictionary *customItem=[NSMutableDictionary dictionary];
    customItem[NSForegroundColorAttributeName]=[UIColor orangeColor];
    customItem[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:customItem forState:UIControlStateNormal];
    
    NSMutableDictionary *disableItem=[NSMutableDictionary dictionary];
    disableItem[NSForegroundColorAttributeName]=[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableItem[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableItem forState:UIControlStateDisabled];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0){//不是根控制器
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
        
        //当从tabbarcontroller跳转到其他控制器，自动隐藏tabbarItem
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}



-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}


@end
