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
#import "UIImageView+WebCache.h"
#import "WBUser.h"
#import "WBStatus.h"
#import "MJExtension.h"
#import "WBLoadDataFooter.h"

@interface WBHomeViewController ()<WBDropDownMenuDelegate>
/**存*/
@property(nonatomic,strong) NSMutableArray *statuses;
@end

@implementation WBHomeViewController

-(NSMutableArray *)statuses
{
    if (!_statuses) {
        self.statuses=[[NSMutableArray alloc] init];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏位置
    [self setTitlePosition];
    
    //设置导航栏用户内容
    [self setTitleUserInfo];
    
    //刷新最新微博数据
    [self refreshNewWeiBoData];
    
    //添加上拉刷新
    [self refreshOldWeiBoData];

}

/** 添加上拉刷新 */
-(void)refreshOldWeiBoData
{
    //添加上拉刷新代码
    self.tableView.tableFooterView=[WBLoadDataFooter load];
}

/** 刷新最新微博数据 */
-(void)refreshNewWeiBoData
{
    //添加下拉刷新
    UIRefreshControl *refresh=[[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refreshNewData:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refresh];
    
    /**启动时自动下拉刷新*/
    //刷新数据
    [refresh beginRefreshing];
    //手动刷新数据
    [self refreshNewData:refresh];
    
}

-(void)refreshNewData:(UIRefreshControl *)control
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    /** since_id	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。*/
    /** max_id	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。*/
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    
    WBStatus *firstStatus=[self.statuses firstObject];
    if(firstStatus){
        params[@"since_id"]=firstStatus.idstr;
    }
//    WBStatus *lastStatus=[self.statuses lastObject];
//    if(lastStatus){
//        params[@"max_id"]=lastStatus.idstr;
//    }
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arrayStatus=[WBStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        NSRange range=NSMakeRange(0, arrayStatus.count);
        NSIndexSet *set=[NSIndexSet indexSetWithIndexesInRange:range];
        [self.statuses insertObjects:arrayStatus atIndexes:set];
        
        [self.tableView reloadData];
        
        [control endRefreshing];
        
        //提示刷新了多少条新数据
        NSUInteger count=arrayStatus.count;
        if (count) {
            [self showNewDataCount:count];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
        [control endRefreshing];
    }];
}
/**提示增加的新微博数*/
-(void)showNewDataCount:(NSUInteger)count
{
    UILabel *label=[[UILabel alloc] init];
    label.text=[NSString stringWithFormat:@"%lu条新微博",(unsigned long)count];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:13];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.width=self.tableView.width;
    label.height=30;
    label.y=64-label.height;
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:1.0 animations:^{
//        label.y+=label.height;
        label.transform=CGAffineTransformMakeTranslation(0, label.height);
    } completion:^(BOOL finished) {
        //UIViewAnimationOptionCurveLinear  表述匀速动画
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
//            label.y-=label.height;
            label.transform=CGAffineTransformIdentity;  //回到原本的位置
        } completion:^(BOOL finished) {
            [label removeFromSuperview];  //销毁label
        }];
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
        WBUser *user=[WBUser objectWithKeyValues:responseObject];
        
        UIButton *btn=(UIButton *)self.navigationItem.titleView;
        [btn setTitle:user.name forState:UIControlStateNormal];
        
        account.name=user.name;
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
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    WBStatus *status=self.statuses[indexPath.row];
    WBUser *user=status.user;
    cell.textLabel.text=user.name;
    cell.detailTextLabel.text=status.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    return cell;
}

@end
