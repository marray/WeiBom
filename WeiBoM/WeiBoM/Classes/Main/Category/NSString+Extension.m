//
//  NSString+Extension.m
//  WeiBoM
//
//  Created by Michael on 10/28/15.
//  Copyright © 2015 agIce. All rights reserved.
//

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
