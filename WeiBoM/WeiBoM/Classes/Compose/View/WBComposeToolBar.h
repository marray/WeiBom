//
//  WBComposeToolBar.h
//  WeiBoM
//
//  Created by Michael on 11/3/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBComposeToolBar;

typedef enum{
    composeToolBarButtonTypeCamera,  //照相
    composeToolBarButtonTypePicture, //相册
    composeToolBarButtonTypeMention, //@
    composeToolBarButtonTypeTrend,   //#
    composeToolBarButtonTypeEmotion  //表情
}composeToolBarButtonType;

@protocol WBComposeToolBarDelegate <NSObject>
@optional
-(void)composeToolBar:(WBComposeToolBar *)composeToolBar buttonDidClick:(composeToolBarButtonType)buttonType;

@end

@interface WBComposeToolBar : UIView

@property(nonatomic,strong) id<WBComposeToolBarDelegate> delegate;

@property(nonatomic,assign) BOOL isChangeKeyborad;

@end
