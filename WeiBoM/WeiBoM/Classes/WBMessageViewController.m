// 
// WBMessageViewController.m
//
// IDECodeSnippetIdentifier: 73CF9958-7FC9-4E1C-A819-C40C3FF09786
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBMessageViewController.h"
#import "WBTest1ViewController.h"

@interface WBMessageViewController ()

@end

@implementation WBMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"test--message--%ld",(long)indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBTest1ViewController *test1=[[WBTest1ViewController alloc] init];
    test1.title=@"测试1控制器";
    //当从tabbarcontroller跳转到其他控制器，自动隐藏tabbarItem
    test1.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:test1 animated:YES];
}


@end
