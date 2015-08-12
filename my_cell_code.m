// My Cell Code
// 
//
// IDECodeSnippetCompletionPrefix: createCell
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: BE8C44E1-7B11-4B92-B638-3B31BBA51C33
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"<#name#>";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}