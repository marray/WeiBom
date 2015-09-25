//
//  WBMessageViewController.m
//  WeiBoM
//
//  Created by Michael on 8/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBMessageViewController.h"
#import "WBTest1ViewController.h"

@interface WBMessageViewController ()

@end

@implementation WBMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"test--message--%ld",(long)indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBTest1ViewController *test1=[[WBTest1ViewController alloc] init];
    test1.title=@"测试1控制器";
    //当从tabbarcontroller跳转到其他控制器，自动隐藏tabbarItem
    test1.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:test1 animated:YES];
}


@end
