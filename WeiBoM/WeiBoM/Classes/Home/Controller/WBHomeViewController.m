// 
// WBHomeViewController.m
//
// IDECodeSnippetIdentifier: 1871363C-B6E3-4BA5-B580-EBC2D38FD3FF
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBHomeViewController.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
}


-(void)friendSearch
{
    WBLOG(@"friendSearch");
}

-(void)pop
{
    WBLOG(@"pop");
}


@end
