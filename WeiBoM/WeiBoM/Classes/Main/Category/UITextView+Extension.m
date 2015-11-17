
//
//  UITextView+Extension.m
//  WeiBoM
//
//  Created by Michael on 11/16/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)

- (void)insertAttributedText:(NSAttributedString *)text
{
    [self insertAttributedText:text withBlock:nil];
}

- (void)insertAttributedText:(NSAttributedString *)text withBlock:(void(^)(NSMutableAttributedString *lastAtrStr))fontBlock
{
    //之前文字附加
    NSMutableAttributedString *attrStr=[[NSMutableAttributedString alloc] init];
    [attrStr appendAttributedString:self.attributedText];
    
    //插入图片表情
    NSUInteger location=self.selectedRange.location;
//    [attrStr insertAttributedString:text atIndex:location];
    [attrStr replaceCharactersInRange:self.selectedRange withAttributedString:text];
    
    //有些操作不想放在这个类中实现，但是又必须实现在插入步骤之前 就用block来实现
    if (fontBlock) {
        fontBlock(attrStr);
    }
    
    self.attributedText=attrStr;
    
    //添加完所有字符之后，移动光标位置到刚添加的表情图片后面一个位置
    self.selectedRange=NSMakeRange(location + 1, 0);
}
/**
  * self.textView.font只对 设置text时有用，对attributedText属性没有用
  *
  */

@end
