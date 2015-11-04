//
//  WBComposePhotosView.h
//  WeiBoM
//
//  Created by Michael on 11/4/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBComposePhotosView : UIView

-(void)addPhoto:(UIImage *)photo;

@property(nonatomic,strong,readonly) NSMutableArray *photos;

@end
