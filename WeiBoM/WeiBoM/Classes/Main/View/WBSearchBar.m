//
//  WBSearchBar.m
//  WeiBoM
//
//  Created by Michael on 10/13/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBSearchBar.h"

@implementation WBSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font=[UIFont systemFontOfSize:13];
        self.placeholder=@"请输入搜索内容";
        self.background=[UIImage imageNamed:@"searchbar_textfield_background"];
        
        //搜索图标
        //这种方法在创建UIImageView时就没有设置尺寸 所以显示不出来内容
        UIImageView *searchIcon=[[UIImageView alloc] init];
        searchIcon.image=[UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width=30;
        searchIcon.height=30;
        searchIcon.contentMode=UIViewContentModeCenter;  //图片没有UIImageView所设置的宽高30那么大  防止图片因填充整个区域而放大图片
        self.leftView=searchIcon;
        self.leftViewMode=UITextFieldViewModeAlways;  //设置左边图片显示的模式
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc] init];
}
@end
