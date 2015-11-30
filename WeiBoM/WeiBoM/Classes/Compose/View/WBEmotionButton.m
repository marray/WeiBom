// 
// WBEmotionButton.m
//
// IDECodeSnippetIdentifier: C6ED6653-9E8C-4488-B5FD-D441EB109F31
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBEmotionButton.h"
#import "WBEmotion.h"

@implementation WBEmotionButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.titleLabel.font=[UIFont systemFontOfSize:32];
    self.adjustsImageWhenHighlighted=NO;  //屏蔽按钮高亮显示效果的另一种方法
}

-(void)setEmotion:(WBEmotion *)emotion
{
    _emotion=emotion;
    
    if(emotion.png){
        //设置表情图片
        [self setImage:[UIImage imageNamed:emotion.png] forState:UIControlStateNormal];
    }else{
        //设置emoji表情
        [self setTitle:emotion.code.emoji forState:UIControlStateNormal];
    }
}

@end
