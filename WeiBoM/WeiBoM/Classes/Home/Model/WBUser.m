// 
// WBUser.m
//
// IDECodeSnippetIdentifier: D3287AE0-B001-4D21-ABF3-BDC78BA2C2BF
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBUser.h"

@implementation WBUser

-(void)setMbtype:(int)mbtype
{
    _mbtype=mbtype;
    
    self.vip=mbtype > 2;
}

@end
