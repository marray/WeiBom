//
//  WBEmotionPageView.h
//  WeiBoM
//
//  Created by Michael on 11/9/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

/**表情最大显示列数*/
#define WBEmotionMaxCols 7
/**表情最大显示行数*/
#define WBEmotionMaxRows 3
/**每一页的表情个数*/
#define WBEmotionPageSize ((WBEmotionMaxCols * WBEmotionMaxRows) - 1)

@interface WBEmotionPageView : UIView
/**每一页显示的表情数组*/
@property(nonatomic,strong) NSArray *emotions;

@end
