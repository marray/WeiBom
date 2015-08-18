// myLazy
// 
//
// IDECodeSnippetCompletionPrefix: Lazy
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 64660BBF-9E91-4AEB-A151-623FDB4258EE
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
- (<#type#> *)<#param#>
{
   if (!<#_param#>) {
      self.<#param#> = [[<#type#> alloc] init];
   }
   return <#_param#>;
}
