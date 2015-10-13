// 
// WBTest1ViewController.m
//
// IDECodeSnippetIdentifier: 198DA858-A0CF-446E-A029-19700909C5FB
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBTest1ViewController.h"
#import "WBTest2ViewController.h"

@interface WBTest1ViewController ()

@end

@implementation WBTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    WBTest2ViewController *test2=[[WBTest2ViewController alloc] init];
    test2.title=@"测试2控制器";
    [self.navigationController pushViewController:test2 animated:YES];
    
}



@end
