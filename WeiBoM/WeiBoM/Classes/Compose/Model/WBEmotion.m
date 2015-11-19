//
//  WBEmotion.m
//  WeiBoM
//
//  Created by Michael on 11/6/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotion.h"

@interface WBEmotion ()<NSCoding>

@end

@implementation WBEmotion

/**
 * 将文件解析成对象模型
 */
-(id)initWithCoder:(NSCoder *)decode
{
    if (self=[super init]) {
        self.chs=[decode decodeObjectForKey:@"chs"];
        self.png=[decode decodeObjectForKey:@"png"];
        self.code=[decode decodeObjectForKey:@"code"];
    }
    return self;
}

/**
 * 将对象模型存储成文件
 */
-(void)encodeWithCoder:(NSCoder *)encode
{
    [encode encodeObject:self.chs forKey:@"chs"];
    [encode encodeObject:self.png forKey:@"png"];
    [encode encodeObject:self.code forKey:@"code"];
}

//重写方法
-(BOOL)isEqual:(WBEmotion *)object
{
    return [self.chs isEqualToString:object.chs] || [self.code isEqualToString:object.code];
}

@end
