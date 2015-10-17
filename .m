// 
// WBNewFeatrueViewController.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: EEE41A1F-3BF0-4A39-8899-10250B6AB666
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBNewFeatrueViewController.h"

#define WBNewFeatrueNumber 4

@interface WBNewFeatrueViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak) UIPageControl *pageControll;
@end

@implementation WBNewFeatrueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UIScrollView
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.frame=self.view.bounds;
    [self.view addSubview:scrollView];
    
    CGFloat scrollW=scrollView.width;
    CGFloat scrollH=scrollView.height;
    for (int i=0; i < WBNewFeatrueNumber; i++) {
        UIImageView *imagePage=[[UIImageView alloc] init];
        imagePage.width=scrollW;
        imagePage.height=scrollH;
        imagePage.x=i * scrollW;
        imagePage.y=0;
        NSString *picName=[NSString stringWithFormat:@"new_feature_%d",i+1];
        imagePage.image=[UIImage imageNamed:picName];
        [scrollView addSubview:imagePage];
        
        if (i == WBNewFeatrueNumber-1) {
            [self setLastImageViewPage:imagePage];
        }
    }
    
    scrollView.contentSize=CGSizeMake(WBNewFeatrueNumber * scrollW, 0);  //能够左右滚动  设置0即不能滚动
    scrollView.bounces=NO;   //隐藏弹簧
    scrollView.showsHorizontalScrollIndicator=NO; //隐藏滚动条
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    
    //创建UIPageControll
    UIPageControl *pageControll=[[UIPageControl alloc] init];
    pageControll.centerX=scrollW * 0.5;
    pageControll.centerY=scrollH - 50;
    pageControll.numberOfPages=WBNewFeatrueNumber;
    pageControll.pageIndicatorTintColor=WBColor(189, 189, 189);
    pageControll.currentPageIndicatorTintColor=WBColor(253, 98, 42);
    [self.view addSubview:pageControll];
    self.pageControll=pageControll;
}


#pragma mark  --UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page=scrollView.contentOffset.x / self.view.width;
    _pageControll.currentPage=(int)(page+0.5);  //四舍五入的计算方法
}

-(void)setLastImageViewPage:(UIImageView *)imagePage
{
    //开启界面交互
    imagePage.userInteractionEnabled=YES;
    
    //分享
    UIButton *shareBtn=[UIButton buttonWithTarget:self Width:200 height:30 centerX:(imagePage.width * 0.5) centerY:(imagePage.height * 0.65) title:@"分享给大家" color:[UIColor blackColor] font:[UIFont systemFontOfSize:13] image:@"new_feature_share_false" selectImage:@"new_feature_share_true" action:@selector(shareClick:)];
    [imagePage addSubview:shareBtn];
    shareBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 10);
    
    //开始微博
    UIButton *startBtn=[[UIButton alloc] init];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.size=startBtn.currentBackgroundImage.size;
    startBtn.centerX=imagePage.width * 0.5;
    startBtn.centerY=imagePage.height * 0.75;
    [startBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [imagePage addSubview:startBtn];
}

-(void)shareClick:(UIButton *)shareBtn
{
    shareBtn.selected=!shareBtn.isSelected;
}

-(void)startClick:(UIButton *)startBtn
{
    
}


@end
