//
//  WBEmotionListView.m
//  WeiBoM
//
//  Created by Michael on 11/5/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionListView.h"
#import "MJExtension.h"
#import "WBEmotionPageView.h"

@interface WBEmotionListView()<UIScrollViewDelegate>
@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UIPageControl *pageControl;
@end

@implementation WBEmotionListView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        //添加scrollView
        UIScrollView *scrollView=[[UIScrollView alloc] init];
        //去掉水平、垂直滚动条子控件
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.pagingEnabled=YES;
        scrollView.delegate=self;
        [self addSubview:scrollView];
        self.scrollView=scrollView;
        
        //添加pageControl
        UIPageControl *pageControl=[[UIPageControl alloc] init];
        pageControl.userInteractionEnabled=NO;  //设置不能点击
        [pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_selected"] forKey:@"currentPageImage"];
        [pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_normal"] forKey:@"pageImage"];
        [self addSubview:pageControl];
        self.pageControl=pageControl;
        
        
    }
    return self;
}

-(void)setEmotions:(NSArray *)emotions
{
    _emotions=emotions;
    
    NSUInteger page=(emotions.count + WBEmotionPageSize - 1)/WBEmotionPageSize;
    self.pageControl.numberOfPages=page;
    
    for (int i=0; i< page; i++) {
        WBEmotionPageView *pageView=[[WBEmotionPageView alloc] init];
        
        //设置分组每页表情
        NSRange range;
        range.location=i * WBEmotionPageSize;
        NSUInteger leave=emotions.count-range.location;
        if (leave>=20) {
            range.length=WBEmotionPageSize;
        }else{
            range.length=leave;
        }
        pageView.emotions=[emotions subarrayWithRange:range];
        
        [self.scrollView addSubview:pageView];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置pageContorl的位置
    self.pageControl.x=0;
    self.pageControl.y=self.height - self.pageControl.height;
    self.pageControl.width=self.width;
    self.pageControl.height=30;
    
    //设置scrollView的位置
    self.scrollView.x=self.scrollView.y=0;
    self.scrollView.width=self.width;
    self.scrollView.height=self.pageControl.y;
    
    //设置scrollView中的子控件位置
    NSUInteger count=self.scrollView.subviews.count;

    for (int i=0; i< count; i++) {
        WBEmotionPageView *pageView=self.scrollView.subviews[i];
        pageView.width=self.scrollView.width;
        pageView.height=self.scrollView.height;
        pageView.x= i * pageView.width;
        pageView.y= 0;
        
    }
    //放在这里设置是为了让contentSize跟随scrollView的宽度变化而变化。
    self.scrollView.contentSize=CGSizeMake(count *self.scrollView.width, 0);
}

#pragma mark -scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page=scrollView.contentOffset.x / scrollView.width ;
    self.pageControl.currentPage=(int)(page + 0.5);
}

@end
