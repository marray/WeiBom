// 
// WBComposeToolBar.m
//
// IDECodeSnippetIdentifier: 90B5D58F-7F3F-4AB8-B006-81273A1F1433
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBComposeToolBar.h"

@interface WBComposeToolBar ()
@property(nonatomic,weak) UIButton *emotionBtn;
@end

@implementation WBComposeToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        
        [self buttonWithImage:@"compose_camerabutton_background" highImage:@"compose_camerabutton_background_highlighted" buttonType:composeToolBarButtonTypeCamera];
        [self buttonWithImage:@"compose_toolbar_picture" highImage:@"compose_toolbar_picture_highlighted" buttonType:composeToolBarButtonTypePicture];
        [self buttonWithImage:@"compose_mentionbutton_background" highImage:@"compose_mentionbutton_background_highlighted" buttonType:composeToolBarButtonTypeMention];
        [self buttonWithImage:@"compose_trendbutton_background" highImage:@"compose_trendbutton_background_highlighted" buttonType:composeToolBarButtonTypeTrend];
        self.emotionBtn=[self buttonWithImage:@"compose_emoticonbutton_background" highImage:@"compose_emoticonbutton_background_highlighted" buttonType:composeToolBarButtonTypeEmotion];
    }
    return self;
}

/**
 *创建一个按钮
 */
-(UIButton *)buttonWithImage:(NSString *)image highImage:(NSString *)highImage buttonType:(composeToolBarButtonType)type
{
    UIButton *btn=[[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=type;
    [self addSubview:btn];
    return btn;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.subviews.count;
    CGFloat btnW=self.width / count;
    CGFloat btnH=self.height;
    for (int i=0; i< count; i++) {
        UIButton *btn=self.subviews[i];
        btn.y=0;
        btn.x=i * btnW;
        btn.width=btnW;
        btn.height=btnH;
    }
    
}

-(void)btnClick:(UIButton *)btn
{
    
    if ([self.delegate respondsToSelector:@selector(composeToolBar:buttonDidClick:)]) {
        [self.delegate composeToolBar:self buttonDidClick:btn.tag];
    }
}

-(void)setIsChangeKeyborad:(BOOL)isChangeKeyborad
{
    _isChangeKeyborad=isChangeKeyborad;
    
    if (isChangeKeyborad) {
        //键盘图片
        [self.emotionBtn setImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] forState:UIControlStateNormal];
        [self.emotionBtn setImage:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] forState:UIControlStateHighlighted];
    }else{
        //表情图片
        [self.emotionBtn setImage:[UIImage imageNamed:@"compose_emoticonbutton_background"] forState:UIControlStateNormal];
        [self.emotionBtn setImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] forState:UIControlStateHighlighted];
    }
}

@end
