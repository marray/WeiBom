//
//  WBTest1ViewController.m
//  WeiBoM
//
//  Created by Michael on 8/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBTest1ViewController.h"
#import "WBTest2ViewController.h"

@interface WBTest1ViewController ()

@end

@implementation WBTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    WBTest2ViewController *test2=[[WBTest2ViewController alloc] init];
    test2.title=@"测试2控制器";
    [self.navigationController pushViewController:test2 animated:YES];
    
}



@end
