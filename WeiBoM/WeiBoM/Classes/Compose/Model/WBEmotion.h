//
//  WBEmotion.h
//  WeiBoM
//
//  Created by Michael on 11/6/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBEmotion : NSObject
/**表情的文字表示*/
@property(nonatomic,copy) NSString *chs;
/**表情的图片*/
@property(nonatomic,copy) NSString *png;
/**Emoji表情的字符表示*/
@property(nonatomic,copy) NSString *code;

@end
