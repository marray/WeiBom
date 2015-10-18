// 
// WBHomeViewController.m
//
// IDECodeSnippetIdentifier: 1871363C-B6E3-4BA5-B580-EBC2D38FD3FF
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBHomeViewController.h"
#import "WBDropDownMenu.h"
#import "WBTitleMenueViewController.h"
#import "AFNetworking.h"
#import "WBAccountManager.h"

@interface WBHomeViewController ()<WBDropDownMenuDelegate>

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏位置
    [self setTitlePosition];
    
    //设置导航栏标题内容
    [self setTitleUserInfo];

}

-(void)setTitleUserInfo
{
    /**
     access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
     uid	false	int64	需要查询的用户ID。*/
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    params[@"uid"]=account.uid;
    
    [manager GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        WBLOG(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
    }];
}

/**设置导航栏位置*/
-(void)setTitlePosition
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.width=150;
    btn.height=30;
    [btn setTitle:@"首页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:17];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    btn.imageEdgeInsets=UIEdgeInsetsMake(0, 70, 0, 0);
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 40);
    [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView=btn;
}

-(void)titleClick:(UIButton *)button
{
    //创建下拉菜单
    WBDropDownMenu *menu=[WBDropDownMenu menue];
    menu.delegate=self;
    
    //设置下拉菜单内容 位置
    WBTitleMenueViewController *tableview=[[WBTitleMenueViewController alloc] init];
    tableview.view.height=200;
    tableview.view.width=200;
    menu.contentController=tableview;
    
    //显示菜单
    [menu showFrom:button];
}

#pragma mark --WBDropDownMenuDelegate 菜单显示和销毁时的通知代理
-(void)dropDownMenuDidShow:(WBDropDownMenu *)menu
{
    UIButton *titleButton=(UIButton *)self.navigationItem.titleView;
    
    titleButton.selected=YES;
}

-(void)dropDownMenuDidDismiss:(WBDropDownMenu *)menu
{
    UIButton *titleButton=(UIButton *)self.navigationItem.titleView;
    
    titleButton.selected=NO;
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
