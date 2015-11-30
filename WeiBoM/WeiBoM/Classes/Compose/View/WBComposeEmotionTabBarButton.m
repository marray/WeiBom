// WeiBoM/WeiBoM/Classes/Compose/View/WBComposeEmotionTabBarButton
// 
//
// IDECodeSnippetIdentifier: 370A45A8-43C2-4896-BAB0-05CDB0A3F18D
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

//
//  WBComposeEmotionTabBarButton.m
//  WeiBoM
//
//  Created by Michael on 11/5/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBComposeEmotionTabBarButton.h"

@implementation WBComposeEmotionTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
        self.titleLabel.font=[UIFont systemFontOfSize:13];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    //阻止长按点击的一切动作
}


@end
