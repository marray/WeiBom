//
//  WBComposeViewController.m
//  WeiBoM
//
//  Created by Michael on 10/30/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBComposeViewController.h"
#import "WBAccountManager.h"

@interface WBComposeViewController ()

@end

@implementation WBComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setNavTitle];
    
    [self setTextView];
    
}

/**
 *设置导航栏
 */
-(void)setTextView
{
    UITextView *textView=[[UITextView alloc] init];
    textView.frame=self.view.bounds;
    
    textView.font=[UIFont systemFontOfSize:14];
    
    
    [self.view addSubview:textView];
}

/**
 *设置导航栏
 */
-(void)setNavTitle
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    
    self.navigationItem.rightBarButtonItem.enabled=NO;
    
    UILabel *titleLabel=[[UILabel alloc] init];
    titleLabel.height=50;
    titleLabel.width=220;
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.numberOfLines=0; //
    
    NSString *name=[WBAccountManager account].name;
    NSString *title=[NSString stringWithFormat:@"发微博"];
    NSString *str=[NSString stringWithFormat:@"%@\n%@",title,name];
    
    NSMutableAttributedString *attrStr=[[NSMutableAttributedString alloc]initWithString:str];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:name]];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[str rangeOfString:title]];
    
    
    titleLabel.attributedText=attrStr;
    self.navigationItem.titleView=titleLabel;
}

-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)send
{
    
}

@end
