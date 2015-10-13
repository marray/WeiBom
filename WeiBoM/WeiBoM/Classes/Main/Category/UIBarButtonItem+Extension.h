//
//  UIBarButtonItem+Extension.h
//  WeiBoM
//
//  Created by Michael on 10/12/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
