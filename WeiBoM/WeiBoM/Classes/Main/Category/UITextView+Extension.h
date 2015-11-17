//
//  UITextView+Extension.h
//  WeiBoM
//
//  Created by Michael on 11/16/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)

- (void)insertAttributedText:(NSAttributedString *)text;

- (void)insertAttributedText:(NSAttributedString *)text withBlock:(void(^)(NSMutableAttributedString *lastAtrStr))fontBlock;

@end
