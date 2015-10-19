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
#import "WBTitleButton.h"

@interface WBHomeViewController ()<WBDropDownMenuDelegate>
/**存*/
@property(nonatomic,strong) NSArray *status;
@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏位置
    [self setTitlePosition];
    
    //设置导航栏用户内容
    [self setTitleUserInfo];
    
    //加载微博内容
    [self loadNewWeiboContent];

}
/**加载微博内容*/
-(void)loadNewWeiboContent
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.status=responseObject[@"statuses"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
    }];
}

/**设置导航栏用户内容*/
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
        NSString *name=responseObject[@"name"];
        UIButton *btn=(UIButton *)self.navigationItem.titleView;
        [btn setTitle:name forState:UIControlStateNormal];
        account.name=name;
        [WBAccountManager save:account];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
    }];
}

/**设置导航栏位置*/
-(void)setTitlePosition
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    WBTitleButton *btn=[[WBTitleButton alloc] init];
    btn.width=250;
    btn.height=40;
    NSString *name=[WBAccountManager account].name;
    [btn setTitle:name?name:@"首页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=btn;
}

/**
 NSMutableDictionary *dicAtr=[NSMutableDictionary dictionary];
 dicAtr[NSFontAttributeName]=btn.titleLabel.font;
 CGFloat titleW=[btn.currentTitle sizeWithAttributes:dicAtr].width;
 //    CGFloat titleW=btn.titleLabel.width;
 //因为图片扁平化，乘上scale系数，保证retina屏幕上图片宽度是正确的 retina屏幕scale系数=2 ，普通屏幕=1.
 CGFloat imageW=btn.imageView.width * [UIScreen mainScreen].scale;
 CGFloat imageLeft=titleW + imageW;
 btn.imageEdgeInsets=UIEdgeInsetsMake(0, imageLeft, 0, 0);
 btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, titleW);
 */

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.status.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textLabel.text=self.status[indexPath.row][@"user"][@"name"];
        cell.detailTextLabel.text=self.status[indexPath.row][@"text"];
    }
    return cell;
}

@end
