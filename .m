// 
// WBTabBar.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 3C5D0A24-A161-405E-8350-1D97FEDE6699
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBTabBar.h"

@interface WBTabBar()
@property(nonatomic,weak) UIButton *composeBtn;
@end

@implementation WBTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        [self addPlusButton];
    }
    return self;
}

+(instancetype)tabBar
{
    return [[self alloc] init];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //1.调整中间按钮的位置
    _composeBtn.centerX=self.width*0.5;
    _composeBtn.centerY=self.height*0.5;
    
    //2.调整其他四个按钮的位置
    NSInteger index=0;
    Class class=NSClassFromString(@"UITabBarButton");
    for (UIView *sub in self.subviews) {
        if([sub isKindOfClass:class]){
            sub.width=self.width/5;
            sub.x=(self.width/5) * index;
            index++;
            if (index==2) {
                index++;
            }
        }
    }
}

-(void)plusClick
{
    if([self.delegate respondsToSelector:@selector(tabBarDidPlusClick:)]){
        [self.delegate tabBarDidPlusClick:self];
    }
}


-(void)addPlusButton
{
    UIButton *composeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [composeBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    composeBtn.size=composeBtn.currentBackgroundImage.size;
    [self addSubview:composeBtn];
    self.composeBtn=composeBtn;
}


@end
