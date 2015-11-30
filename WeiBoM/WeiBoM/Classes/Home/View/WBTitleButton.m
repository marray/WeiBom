// 
// WBTitleButton.m
//
// IDECodeSnippetIdentifier: 6E46EAFC-BB7D-4772-99CF-24849781F11D
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBTitleButton.h"

@implementation WBTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont boldSystemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    frame.size.width += 10;
    [super setFrame:frame];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //改变按钮内部的位置，只需调整x值即可
    self.titleLabel.x=self.imageView.x;
    self.imageView.x=CGRectGetMaxX(self.titleLabel.frame) + 10;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self layoutIfNeeded]; 
    [self sizeToFit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self layoutIfNeeded];
    [self sizeToFit];
}



@end
