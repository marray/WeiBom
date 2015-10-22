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
#import "WBStatusFrame.h"
#import "MJExtension.h"
#import "WBLoadDataFooter.h"
#import "WBStatusCell.h"
#import "WBStatus.h"

@interface WBHomeViewController ()<WBDropDownMenuDelegate>
/**存每条微博的数组*/
@property(nonatomic,strong) NSMutableArray *statusFrames;
@end

@implementation WBHomeViewController

-(NSMutableArray *)statusFrames
{
    if (!_statusFrames) {
        self.statusFrames=[[NSMutableArray alloc] init];
    }
    return _statusFrames;
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
    
    //未读微博数
    NSTimer *thread=[NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(unReadWeiboRemind) userInfo:nil repeats:YES];  //添加定时器，过三秒发一次请求
    [[NSRunLoop mainRunLoop] addTimer:thread forMode:NSRunLoopCommonModes];  //更改主线程运行模式 让主线程也抽时间处理thread线程

}

/**获取未读微博数 显示*/
-(void)unReadWeiboRemind
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    params[@"uid"]=account.uid;
    
    [manager GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *status=[responseObject[@"status"] description];  //NSNUmber 转成 NSString 用 description
        
        if ([status isEqualToString:@"0"]) {
            self.tabBarItem.badgeValue=nil;
            [UIApplication sharedApplication].applicationIconBadgeNumber=0;
        }else{
            self.tabBarItem.badgeValue=status;
            [UIApplication sharedApplication].applicationIconBadgeNumber=status.intValue;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
    }];
    
}


/** 添加上拉刷新 */
-(void)refreshOldWeiBoData
{
    //添加上拉刷新代码
    WBLoadDataFooter *footer=[WBLoadDataFooter load];
    footer.hidden=YES;
    self.tableView.tableFooterView=footer;
    
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

/** 将WBStatus模型转成WBStatusFrame模型 */
-(NSArray *)statusFrameWithStatusArray:(NSArray *)statusArray
{
    NSMutableArray *statusFrameArray=[NSMutableArray array];
    for (WBStatus *status in statusArray) {
        WBStatusFrame *statusFrame=[[WBStatusFrame alloc] init];
        statusFrame.status=status;
        [statusFrameArray addObject:statusFrame];
    }
    return statusFrameArray;
}


/** 加载更多微博数据*/
-(void)loadMoreWeiboData
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    /** max_id	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。*/
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    
    WBStatusFrame *lastStatusFrame=[self.statusFrames lastObject];
    if(lastStatusFrame){
        long long idstr=lastStatusFrame.status.idstr.longLongValue - 1;  //减一是因为有一条数据重复读取
        params[@"max_id"]=@(idstr);
    }
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arrayStatus=[WBStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        //转换模型
        NSArray *statusFrameArray=[self statusFrameWithStatusArray:arrayStatus];
        
        [self.statusFrames addObjectsFromArray:statusFrameArray];
        
        [self.tableView reloadData];
        
        self.tableView.tableFooterView.hidden=YES;
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WBLOG(@"%@",error);
        self.tableView.tableFooterView.hidden=YES;
    }];
}

/** 下拉刷新新的微博数据*/
-(void)refreshNewData:(UIRefreshControl *)control
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    /** since_id	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。*/
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    
    WBStatusFrame *firstStatusFrame=[self.statusFrames firstObject];
    if(firstStatusFrame){
        params[@"since_id"]=firstStatusFrame.status.idstr;
    }
    
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arrayStatus=[WBStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        //转换模型
        NSArray *statusFrameArray=[self statusFrameWithStatusArray:arrayStatus];
        
        NSRange range=NSMakeRange(0, arrayStatus.count);
        NSIndexSet *set=[NSIndexSet indexSetWithIndexesInRange:range];
        [self.statusFrames insertObjects:statusFrameArray atIndexes:set];
        
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
    //刷新后清空未读提示
    self.tabBarItem.badgeValue=nil;
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    
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

#pragma mark TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusCell *cell=[WBStatusCell cellwithTableView:tableView];
    
    cell.statusFrame=self.statusFrames[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusFrame *frame=self.statusFrames[indexPath.row];
    
    return frame.cellHeigh;
}

#pragma mark SctrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statusFrames.count == 0 || self.tableView.tableFooterView.hidden == NO ) return;
    
    CGFloat contentY=scrollView.contentOffset.y;  //-64
    CGFloat scrollY=scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.height - self.tableView.tableFooterView.height ;
    
    if (contentY > scrollY) {  //滚动到最后一个cell完全出现时加载数据
        
        self.tableView.tableFooterView.hidden=NO;
        
        [self loadMoreWeiboData]; //加载更多数据
        
    }
    
}

@end
