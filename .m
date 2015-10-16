// 
// WBDropDownMenu.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: E9A10831-6D9A-4667-AE9E-062CF873B8D0
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBDropDownMenu.h"

@interface WBDropDownMenu()
@property(nonatomic,weak) UIImageView *containerView;

@end

@implementation WBDropDownMenu

-(UIImageView *)containerView
{
    if(!_containerView){
        UIImageView *containerView=[[UIImageView alloc] init];
        containerView.image=[UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled=YES;
        [self addSubview:containerView];
        self.containerView=containerView;
        
    }
    return _containerView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        //挡板的图片
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

+(instancetype)menue
{
    return [[self alloc] init];
}


-(void)showFrom:(UIView *)from
{
    //保证弹出的界面在最上面
    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    self.frame=window.bounds;
    
    //坐标系转换
//    CGRect newFrame=[from convertRect:from.bounds toView:window];
    CGRect newFrame=[from.superview convertRect:from.frame toView:window];
    
    
    self.containerView.centerX=CGRectGetMidX(newFrame);
    self.containerView.y=CGRectGetMaxY(newFrame);
    
    //显示时 发出通知
    if([self.delegate respondsToSelector:@selector(dropDownMenuDidShow:)]){
        [self.delegate dropDownMenuDidShow:self];
    }
}

-(void)dismiss
{
    [self removeFromSuperview];
    
    //销毁时 发出通知
    if([self.delegate respondsToSelector:@selector(dropDownMenuDidDismiss:)]){
        [self.delegate dropDownMenuDidDismiss:self];
    }
    
}

-(void)setContent:(UIView *)content
{
    _content=content;
    
    content.x=10;
    content.y=15;
    self.containerView.height=CGRectGetMaxY(content.frame)+11;
    self.containerView.width=CGRectGetMaxX(content.frame)+10;
    
    //[_containerView addSubview:_content]出错，懒加载，此时_containerView为空.
    [self.containerView addSubview:_content];
}

-(void)setContentController:(UIViewController *)contentController
{
    _contentController=contentController;
    
    self.content=contentController.view;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
