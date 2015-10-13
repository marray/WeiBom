//
//  WBHomeViewController.m
//  WeiBoM
//
//  Created by Michael on 8/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBHomeViewController.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
}


-(void)friendSearch
{
    WBLOG(@"friendSearch");
}

-(void)pop
{
    WBLOG(@"pop");
}


@end
