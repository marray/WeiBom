// 
// WBTitleMenueViewController.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 56929FB1-6CAE-46DE-B7FD-44B4634C7762
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

#import "WBTitleMenueViewController.h"

@interface WBTitleMenueViewController ()

@end

@implementation WBTitleMenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if(indexPath.row==0){
        cell.textLabel.text=@"朋友圈";
    }
    if(indexPath.row==1){
        cell.textLabel.text=@"特别关注";
    }
    if(indexPath.row==2){
        cell.textLabel.text=@"同事";
    }

    
    return cell;
}

@end
