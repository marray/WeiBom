//
//  WBStatusPhotosView.h
//  WeiBoM
//
//  Created by Michael on 10/28/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBStatusPhotosView : UIView

@property(nonatomic,strong) NSArray *photos;
/**
 *   根据图片数计算总体的尺寸
 */
+(CGSize)sizeWithCount:(NSUInteger)count;

@end
