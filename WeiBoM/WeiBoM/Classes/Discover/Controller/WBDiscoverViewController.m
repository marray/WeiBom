//
//  WBDiscoverViewController.m
//  WeiBoM
//
//  Created by Michael on 8/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBDiscoverViewController.h"

@interface WBDiscoverViewController ()

@end

@implementation WBDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //系统自带的搜索框  不能随意设置高度
//    UISearchBar *searchBar=[[UISearchBar alloc] init];
//    searchBar.scopeBarBackgroundImage=[UIImage imageNamed:@"searchbar_textfield_background"];
    
    //自定义搜索框
    UITextField *searchBar=[[UITextField alloc] init];
    searchBar.width=300;
    searchBar.height=30;
    searchBar.font=[UIFont systemFontOfSize:13];
    searchBar.placeholder=@"请输入搜索内容";
    searchBar.background=[UIImage imageNamed:@"searchbar_textfield_background"];
    
    //搜索图标
    //这种方法在创建UIImageView时就没有设置尺寸 所以显示不出来内容
    UIImageView *searchIcon=[[UIImageView alloc] init];
    searchIcon.image=[UIImage imageNamed:@"searchbar_textfield_search_icon"];
    
    //这种方法在创建UIImageView时就以图片的大小设置了UIImageView的尺寸 所以可以显示出来
//    UIImage *image=[UIImage imageNamed:@"searchbar_textfield_search_icon"];
//    UIImageView *searchIcon=[[UIImageView alloc] initWithImage:image];
    
    searchIcon.width=30;
    searchIcon.height=30;
    searchIcon.contentMode=UIViewContentModeCenter;  //图片没有UIImageView所设置的宽高30那么大  防止图片因填充整个区域而放大图片
    
    searchBar.leftView=searchIcon;
    searchBar.leftViewMode=UITextFieldViewModeAlways;  //设置左边图片显示的模式
    
    self.navigationItem.titleView=searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
