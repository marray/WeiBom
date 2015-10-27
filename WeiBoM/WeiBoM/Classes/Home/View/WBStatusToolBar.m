//
//  WBStatusToolBar.m
//  WeiBoM
//
//  Created by Michael on 10/27/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBStatusToolBar.h"
#import "WBStatus.h"

@interface WBStatusToolBar()
/** 按钮数组 */
@property(nonatomic,strong) NSMutableArray *btns;
/** 分割线数组 */
@property(nonatomic,strong) NSMutableArray *cardLines;
/** 转发按钮 */
@property(nonatomic,weak) UIButton *retweetBtn;
/** 评论按钮 */
@property(nonatomic,weak) UIButton *commentBtn;
/** 点赞按钮 */
@property(nonatomic,weak) UIButton *atitudeBtn;

@end

@implementation WBStatusToolBar

-(NSMutableArray *)btns
{
    if (!_btns) {
        self.btns=[[NSMutableArray alloc] init];
    }
    return _btns;
}

-(NSMutableArray *)cardLines
{
    if (!_cardLines) {
        self.cardLines=[[NSMutableArray alloc] init];
    }
    return _cardLines;
}


+(instancetype)toolbar
{
    return [[self alloc] init];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_card_bottom_background"]];
        
        self.retweetBtn=[self getBarButton:@"转发" image:@"timeline_icon_retweet"];
        self.commentBtn=[self getBarButton:@"评论" image:@"timeline_icon_comment"];
        self.atitudeBtn=[self getBarButton:@"赞" image:@"timeline_icon_unlike"];
        
        [self addCardLine];
        [self addCardLine];
    }
    return self;
}
/**
 *  添加分割线
 */
-(void)addCardLine
{
    UIImageView *line=[[UIImageView alloc] init];
    line.image=[UIImage imageNamed:@"timeline_card_bottom_line"];
    [self addSubview:line];
    [self.cardLines addObject:line];
}

/**
 *  创建一个按钮
 *
 *  @param title 按钮文字
 *  @param image 按钮图片
 */
-(UIButton *)getBarButton:(NSString *)title image:(NSString *)image
{
    UIButton *btn=[[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:WBColor(137, 137, 137) forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
    [self addSubview:btn];
    
    [self.btns addObject:btn];
    
    return btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.btns.count;
    CGFloat btnW=self.width / count;
    CGFloat btnH=self.height;
    for (int i=0; i< count; i++) {
        UIButton *btn=self.subviews[i];
        btn.y=0;
        btn.x=i * btnW;
        btn.width=btnW;
        btn.height=btnH;
    }
    
    NSUInteger lineCount=self.cardLines.count;
    for (int i=0; i< lineCount; i++) {
        UIImageView *line=self.cardLines[i];
        line.y=0;
        line.x=(i +1 ) * btnW;
        line.width=1;
        line.height=btnH;
    }
    
}

-(void)setStatus:(WBStatus *)status
{
    _status=status;
    
    [self setButtonCount:status.reposts_count btn:self.retweetBtn title:@"转发"];
    [self setButtonCount:status.comments_count btn:self.commentBtn title:@"评论"];
    [self setButtonCount:status.attitudes_count btn:self.atitudeBtn title:@"赞"];
    
}

-(void)setButtonCount:(int)count btn:(UIButton *)btn title:(NSString *)title
{
    if (count) {
        title=[NSString stringWithFormat:@"%d",count];
        [btn setTitle:title forState:UIControlStateNormal];
        if (count > 10000) {
            int countWan=count / 10000;
            title=[NSString stringWithFormat:@"%d万",countWan];
            //去掉整除的情况
//            title=[title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }
    }
    [btn setTitle:title forState:UIControlStateNormal];
    
}



@end
