//
//  WBTextView.h
//  WeiBoM
//
//  Created by Michael on 11/2/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBTextView : UITextView
/** 占位字符*/
@property(nonatomic,copy) NSString *placeholder;

/** 占位字符颜色*/
@property(nonatomic,strong) UIColor *placeholderColor;

@end
