//
//  WBStatusFrame.h
//  WeiBoM
//
//  Created by Michael on 10/22/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBStatus;

@interface WBStatusFrame : NSObject

@property(nonatomic,strong) WBStatus *status;

/** 原创微博整体 */
@property(nonatomic,assign) CGRect originalViewFrame;

/** 用户头像 */
@property(nonatomic,assign) CGRect iconImageFrame;

/** vip图片 */
@property(nonatomic,assign) CGRect vipImageFrame;

/** 用户昵称 */
@property(nonatomic,assign) CGRect nameLabelFrame;

/** 创建时间 */
@property(nonatomic,assign) CGRect timeLabelFrame;

/** 发布来源 */
@property(nonatomic,assign) CGRect sourceLabelFrame;

/** 原创微博正文 */
@property(nonatomic,assign) CGRect contentLabelFrame;

/**原创微博图片*/
@property(nonatomic,assign) CGRect contentImageViewFrame;

/**cell的高度*/
@property(nonatomic,assign) CGFloat cellHeigh;

@end
