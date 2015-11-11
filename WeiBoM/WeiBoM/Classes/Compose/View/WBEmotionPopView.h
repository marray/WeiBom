//
//  WBEmotionPopView.h
//  WeiBoM
//
//  Created by Michael on 11/10/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBEmotion;
@interface WBEmotionPopView : UIView

+(instancetype)popView;

@property(nonatomic,strong) WBEmotion *emotion;

@end
