// 
// WBDiscoverViewController.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: C05F39AD-F1DB-4AD3-BC02-FBC43F0E7468
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBDiscoverViewController.h"
#import "WBSearchBar.h"

@interface WBDiscoverViewController ()

@end

@implementation WBDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //系统自带的搜索框  不能随意设置高度
    
    //自定义搜索框
    WBSearchBar *searchBar=[WBSearchBar searchBar];
    searchBar.width=300;
    searchBar.height=30;
    self.navigationItem.titleView=searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
