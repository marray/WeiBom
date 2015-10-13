//
//  WBDiscoverViewController.m
//  WeiBoM
//
//  Created by Michael on 8/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBDiscoverViewController.h"
#import "WBSearchBar.h"

@interface WBDiscoverViewController ()

@end

@implementation WBDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //系统自带的搜索框  不能随意设置高度
    
    //自定义搜索框
    WBSearchBar *searchBar=[WBSearchBar searchBar];
    searchBar.width=300;
    searchBar.height=30;
    self.navigationItem.titleView=searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
