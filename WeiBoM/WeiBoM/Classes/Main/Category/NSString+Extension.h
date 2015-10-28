//
//  NSString+Extension.h
//  WeiBoM
//
//  Created by Michael on 10/28/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

-(CGSize)widthWithFont:(UIFont *)font maxW:(CGFloat)maxw;

-(CGSize)widthWithFont:(UIFont *)font;
@end
