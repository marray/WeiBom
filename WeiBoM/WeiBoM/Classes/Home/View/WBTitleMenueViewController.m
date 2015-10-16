//
//  WBTitleMenueViewController.m
//  WeiBoM
//
//  Created by Michael on 10/13/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBTitleMenueViewController.h"

@interface WBTitleMenueViewController ()

@end

@implementation WBTitleMenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if(indexPath.row==0){
        cell.textLabel.text=@"朋友圈";
    }
    if(indexPath.row==1){
        cell.textLabel.text=@"特别关注";
    }
    if(indexPath.row==2){
        cell.textLabel.text=@"同事";
    }

    
    return cell;
}

@end
