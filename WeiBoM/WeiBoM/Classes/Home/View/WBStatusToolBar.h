//
//  WBStatusToolBar.h
//  WeiBoM
//
//  Created by Michael on 10/27/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBStatus;

@interface WBStatusToolBar : UIView
+(instancetype)toolbar;

@property(nonatomic,strong) WBStatus *status;

@end
