//
//  WBNavigationController.m
//  WeiBoM
//
//  Created by Michael on 10/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBNavigationController.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏按钮主题
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    
    NSMutableDictionary *customItem=[NSMutableDictionary dictionary];
    customItem[NSForegroundColorAttributeName]=[UIColor orangeColor];
    customItem[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:customItem forState:UIControlStateNormal];
    
    NSMutableDictionary *disableItem=[NSMutableDictionary dictionary];
    disableItem[NSForegroundColorAttributeName]=[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableItem[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableItem forState:UIControlStateDisabled];
    
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
