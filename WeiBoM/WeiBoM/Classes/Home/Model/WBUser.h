//
//  WBUser.h
//  WeiBoM
//
//  Created by Michael on 10/20/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject

/** string	字符串型的用户UID */
@property(nonatomic,copy) NSString *idstr;

/** string	友好显示名称 */
@property(nonatomic,copy) NSString *name;

/** string	用户头像地址（中图），50×50像素 */
@property(nonatomic,copy) NSString *profile_image_url;

/** string	会员等级 */
@property(nonatomic,assign) int mbrank;

/** string	 > 2 是会员 */
@property(nonatomic,assign) int mbtype;

/** 是否为会员 */
@property(nonatomic,assign,getter=isVip) BOOL vip;
@end
