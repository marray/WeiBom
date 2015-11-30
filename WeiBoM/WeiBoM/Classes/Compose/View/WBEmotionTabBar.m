// 
// WBEmotionTabBar.m
//
// IDECodeSnippetIdentifier: F373C03A-AE29-47DE-B0D4-42428985AA1D
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBEmotionTabBar.h"
#import "WBComposeEmotionTabBarButton.h"

@interface WBEmotionTabBar()
@property(nonatomic,weak) WBComposeEmotionTabBarButton *selectedBtn;
@end

@implementation WBEmotionTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self buttonWithTitle:@"最近" type:WBEmotionTabBarButtonTypeRecent];
        [self buttonWithTitle:@"默认" type:WBEmotionTabBarButtonTypeDefault];
        [self buttonWithTitle:@"Emoji" type:WBEmotionTabBarButtonTypeEmoji];
        [self buttonWithTitle:@"浪小花" type:WBEmotionTabBarButtonTypeLxh];
    }
    return self;
}

/**创建一个按钮*/
-(WBComposeEmotionTabBarButton *)buttonWithTitle:(NSString *)title type:(WBEmotionTabBarButtonType)type
{
    WBComposeEmotionTabBarButton *btn=[[WBComposeEmotionTabBarButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag=type;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    if (self.subviews.count==1) {
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_left_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_left_selected"] forState:UIControlStateDisabled];
        
    }else if(self.subviews.count==4){
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_right_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_right_selected"] forState:UIControlStateDisabled];
        
    }else{
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_mid_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_table_mid_selected"] forState:UIControlStateDisabled];

    }
    return btn;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.subviews.count;
    CGFloat btnW=self.width / count;
    CGFloat btnH=self.height;
    for (int i=0; i< count; i++) {
        WBComposeEmotionTabBarButton *btn=self.subviews[i];
        btn.y=0;
        btn.x=i * btnW;
        btn.width=btnW;
        btn.height=btnH;
    }
}

//重写setDelegate方法 ，在设置delegate时将默认选中按钮设置好
-(void)setDelegate:(id<WBEmotionTabBarDelegate>)delegate
{
    _delegate=delegate;
    
    [self btnClick:(WBComposeEmotionTabBarButton *)[self viewWithTag:WBEmotionTabBarButtonTypeDefault]];
}

-(void)btnClick:(WBComposeEmotionTabBarButton *)btn
{
    self.selectedBtn.enabled=YES;
    btn.enabled=NO;
    self.selectedBtn=btn;
    
    if ([self.delegate respondsToSelector:@selector(emotionTabBar:withButtonType:)]) {
        [self.delegate emotionTabBar:self withButtonType:btn.tag];
    }
}


@end
