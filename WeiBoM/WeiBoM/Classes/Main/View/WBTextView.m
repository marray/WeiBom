//
//  WBTextView.m
//  WeiBoM
//
//  Created by Michael on 11/2/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBTextView.h"

@implementation WBTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //监听当前UITextView的文字发生改变
        [WBNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

-(void)textDidChange
{
    //重绘
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    if (self.hasText) return;
    
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=self.font;
    attr[NSForegroundColorAttributeName]=self.placeholderColor ? self.placeholderColor:WBColor(137, 137, 137);
//    [self.placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:attr];
    CGFloat x=5;
    CGFloat y=8;
    CGFloat width=rect.size.width - 2 * x ;
    CGFloat height=rect.size.height - 2 * y ;
    CGRect placeholderRect=CGRectMake(x, y, width, height);
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder=[placeholder copy];
    
    [self setNeedsDisplay];
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor=placeholderColor;
    
    [self setNeedsDisplay];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    
    [self setNeedsDisplay];
}

-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}

-(void)dealloc
{
    [WBNotificationCenter removeObserver:self];
}


@end
