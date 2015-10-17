//
//  WBOAthuViewController.m
//  WeiBoM
//
//  Created by Michael on 10/16/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "WBOAthuViewController.h"
#import "AFNetworking.h"

@interface WBOAthuViewController ()<UIWebViewDelegate>

@end

@implementation WBOAthuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建webview
    UIWebView *webview=[[UIWebView alloc] init];
    webview.frame=self.view.bounds;
    [self.view addSubview:webview];
    
    //加载授权登录界面
    /* 请求参数
     client_id	true	string	申请应用时分配的AppKey。
     redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page
     */
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1707832585&redirect_uri=http://xb.weibom.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
    webview.delegate=self;
    
}



-(void)webViewDidStartLoad:(UIWebView *)webView
{
//    WBLOG(@"webViewDidStartLoad");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    WBLOG(@"webViewDidFinishLoad");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL);
    NSString *url=request.URL.absoluteString;
    NSRange range=[url rangeOfString:@"code="];
    
    WBLOG(@"range:%lu",(unsigned long)range.length);
    if(range.length!=0){
        NSInteger index=range.location+range.length;
        NSString *code=[url substringFromIndex:index];
        WBLOG(@"code:%@",code);
        [self getAccessTokenWithCode:code];
    }
    
    return YES;
}

-(void)getAccessTokenWithCode:(NSString *)code
{
    //获取accessToken
    /*
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     */
    AFHTTPRequestOperationManager *requestManager=[AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"]=@"1707832585";
    params[@"client_secret"]=@"7b6d1a6aee7ce1efeeb3d0ab826d000c";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=@"1707832585";
    params[@"redirect_uri"]=@"http://xb.weibom.com";

    [requestManager POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        WBLOG(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


@end
