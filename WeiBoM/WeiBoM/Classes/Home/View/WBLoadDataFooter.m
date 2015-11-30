// 
// WBLoadDataFooter.m
//
// IDECodeSnippetIdentifier: C5689724-29C6-40F8-89D9-74C519CD2F12
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBLoadDataFooter.h"

@implementation WBLoadDataFooter

+(instancetype)load
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WBLoadDataFooter" owner:nil options:nil] firstObject];
}

@end
