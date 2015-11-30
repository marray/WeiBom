// 
// NSString+Extension.m
//
// IDECodeSnippetIdentifier: F74E4C53-47DE-4041-9D8E-DC137A106248
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(CGSize)widthWithFont:(UIFont *)font maxW:(CGFloat)maxw
{
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=font;
    CGSize maxSize={maxw , MAXFLOAT };
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
}

-(CGSize)widthWithFont:(UIFont *)font
{
    return [self widthWithFont:font maxW:MAXFLOAT];
    
}

@end
