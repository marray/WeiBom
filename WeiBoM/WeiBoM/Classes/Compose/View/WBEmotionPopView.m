//
//  WBEmotionPopView.m
//  WeiBoM
//
//  Created by Michael on 11/10/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBEmotionPopView.h"
#import "WBEmotionButton.h"

@interface WBEmotionPopView()
@property (weak, nonatomic) IBOutlet WBEmotionButton *emotionButton;

@end
@implementation WBEmotionPopView

+(instancetype)popView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WBEmotionPopView" owner:nil options:nil] lastObject];
}

-(void)setEmotion:(WBEmotion *)emotion
{
    _emotion=emotion;
    
    self.emotionButton.emotion=emotion;
}


@end
