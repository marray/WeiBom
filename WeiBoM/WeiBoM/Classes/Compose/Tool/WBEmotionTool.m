// 
// WBEmotionTool.m
//
// IDECodeSnippetIdentifier: 2E791853-3B23-49BE-8E31-E6A6D9806722
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBEmotionTool.h"
#import "WBEmotion.h"

#define WBRecentEmotionPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"recentEmotions.archive"]

@implementation WBEmotionTool

static NSMutableArray *_emotions;

//系统在第一次使用这个类的时候调用 并且只调用一次
+(void)initialize
{
    _emotions=(NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithFile:WBRecentEmotionPath];
    if (_emotions == nil) {
        _emotions=[NSMutableArray array];
    }
}

+(void)saveRecentEmotion:(WBEmotion *)emotion
{
    
    //移除重复的表情 1⃣️
    [_emotions removeObject:emotion];
    
    //第2⃣️中方法
//    for (WBEmotion *oneEmotion in emotions) {
//        if ([oneEmotion.chs isEqualToString:emotion.chs] || [oneEmotion.code isEqualToString:emotion.code]) {
//            [emotions removeObject:oneEmotion];
//            break;
//        }
//    }
    
    //插入到数组最前面
    [_emotions insertObject:emotion atIndex:0];
    
    //存储到沙盒
    [NSKeyedArchiver archiveRootObject:_emotions toFile:WBRecentEmotionPath];
}

+(NSArray *)recentEmotion
{
    return _emotions;
}


@end
