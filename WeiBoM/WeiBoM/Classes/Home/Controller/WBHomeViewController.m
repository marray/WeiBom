// 
// WBHomeViewController.m
//
// IDECodeSnippetIdentifier: 1871363C-B6E3-4BA5-B580-EBC2D38FD3FF
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBHomeViewController.h"
#import "WBDropDownMenu.h"
#import "WBTitleMenueViewController.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.width=150;
    btn.height=30;
    [btn setTitle:@"首页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:17];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    btn.imageEdgeInsets=UIEdgeInsetsMake(0, 70, 0, 0);
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 40);
    [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView=btn;

    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.width=150;
    btn2.height=30;
    btn2.x=80;
    btn2.y=30;
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

-(void)titleClick:(UIButton *)button
{
    WBDropDownMenu *menu=[WBDropDownMenu menue];
    
    WBTitleMenueViewController *tableview=[[WBTitleMenueViewController alloc] init];
    tableview.view.height=200;
    tableview.view.width=200;
    menu.contentController=tableview;
    
    [menu showFrom:button];
    
    
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
