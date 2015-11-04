//
//  WBComposeViewController.m
//  WeiBoM
//
//  Created by Michael on 10/30/15.
//  Copyright © 2015 agIce. All rights reserved.
//

#import "WBComposeViewController.h"
#import "WBAccountManager.h"
#import "WBTextView.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "WBComposeToolBar.h"
#import "WBComposePhotosView.h"

@interface WBComposeViewController ()<UITextViewDelegate,WBComposeToolBarDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,weak) WBTextView *textView;
@property(nonatomic,weak) WBComposeToolBar *toolbar;
@property(nonatomic,weak) WBComposePhotosView *photosView;
@end

@implementation WBComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //设置导航栏
    [self setNavTitle];
    
    //设置输入框
    [self setTextView];
    
    //添加工具条
    [self setToolBar];
    
    //添加相册
    [self addPhotosView];
    
}

-(void)dealloc
{
    [WBNotificationCenter removeObserver:self.textView];
    [WBNotificationCenter removeObserver:self];
}


#pragma mark 初始化方法

/**
 *添加相册
 */
-(void)addPhotosView
{
    WBComposePhotosView *photosView=[[WBComposePhotosView alloc] init];
    photosView.height=self.view.height;
    photosView.width=self.view.width;
    photosView.y=80;
    photosView.x=10;
    [self.textView addSubview:photosView];
    self.photosView=photosView;
}

/**
 *添加工具条
 */
-(void)setToolBar
{
    WBComposeToolBar *toolbar=[[WBComposeToolBar alloc] init];
    toolbar.width=self.view.width;
    toolbar.height=44;
    toolbar.y=self.view.height - toolbar.height;
    toolbar.delegate=self;
    [self.view addSubview:toolbar];
    self.toolbar=toolbar;
    
}

/**
 *设置输入框
 */
-(void)setTextView
{
    WBTextView *textView=[[WBTextView alloc] init];
    textView.frame=self.view.bounds;
    textView.font=[UIFont systemFontOfSize:14];
    textView.alwaysBounceVertical=YES;
    textView.delegate=self;
    textView.placeholder=@"分享新鲜事...";
    [self.view addSubview:textView];
    self.textView=textView;
    //成为第一响应者，自动叫出键盘
    [self.textView becomeFirstResponder];
    
    //文字改变的通知
    [WBNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
    //键盘frame改变的通知
    [WBNotificationCenter addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

/**
 *设置导航栏
 */
-(void)setNavTitle
{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    self.navigationItem.rightBarButtonItem.enabled=NO;
    
    NSString *name=[WBAccountManager account].name;
    NSString *title=@"发微博";
    
    if(name){
        UILabel *titleLabel=[[UILabel alloc] init];
        titleLabel.height=50;
        titleLabel.width=220;
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.numberOfLines=0; //设置换行

        NSString *str=[NSString stringWithFormat:@"%@\n%@",title,name];
        NSMutableAttributedString *attrStr=[[NSMutableAttributedString alloc]initWithString:str];
        
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:name]];
        [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[str rangeOfString:title]];
        
        titleLabel.attributedText=attrStr;
        self.navigationItem.titleView=titleLabel;
        
    }else{
        self.title=title;
    }
    
}

#pragma mark 事件监听方法
-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)send
{
    if (self.photosView.photos.count) {
        [self sendWithImage];
    }else{
        [self sendWithoutImage];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *发布有图片的微博
 */
-(void)sendWithImage
{
    /**
     access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
     status	true	string	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。
     pic	true	binary	要上传的图片，仅支持JPEG、GIF、PNG格式，图片大小小于5M。
     */
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    params[@"status"]=self.textView.text;
    
    [manager POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        UIImage *image=[self.photosView.photos firstObject];
        NSData *binaryImage=UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:binaryImage name:@"pic" fileName:@"test.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"发布成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发布失败"];
    }];

}
/**
 *发布没有图片的微博
 */
-(void)sendWithoutImage
{
    /**
     access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
     status	true	string	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。
     */
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];

    WBAccount *account=[WBAccountManager account];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=account.access_token;
    params[@"status"]=self.textView.text;

    [manager POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"发布成功"];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发布失败"];
    }];
}

-(void)textDidChange
{
    self.navigationItem.rightBarButtonItem.enabled=self.textView.hasText;
}

-(void)keyboardChange:(NSNotification *)notification
{
    /**
     UIKeyboardFrameEndUserInfoKey = NSRect: {{0, 315}, {320, 253}},
     UIKeyboardAnimationDurationUserInfoKey = 0.25,
     UIKeyboardAnimationCurveUserInfoKey = 7
     */
    NSDictionary *useInfo=notification.userInfo;
    double duration=[useInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect kayboardFrame=[useInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.toolbar.y=kayboardFrame.origin.y - self.toolbar.height;
        
    }];
    
}

#pragma mark UITextViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark -WBComposeToolBarDelegate
-(void)composeToolBar:(WBComposeToolBar *)composeToolBar buttonDidClick:(composeToolBarButtonType)buttonType
{
    
    switch (buttonType) {
        case composeToolBarButtonTypeCamera: //照相
            [self openCamera];
            break;
            
        case composeToolBarButtonTypePicture: //相册
            [self openPictrue];
            break;
            
        case composeToolBarButtonTypeMention:  //@
            WBLOG(@"@");
            break;
            
        case composeToolBarButtonTypeTrend:  //#
            WBLOG(@"#");
            break;
            
        case composeToolBarButtonTypeEmotion: //表情
            [self openEmotion];
            break;
            
        default:
            break;
    }
}

-(void)openEmotion
{
    
}


-(void)openCamera
{
    [self openImagePickerControllerWithType:UIImagePickerControllerSourceTypeCamera];
}


-(void)openPictrue
{
    [self openImagePickerControllerWithType:UIImagePickerControllerSourceTypePhotoLibrary];
}


-(void)openImagePickerControllerWithType:(UIImagePickerControllerSourceType)type
{
    if (![UIImagePickerController isSourceTypeAvailable:type]) return;
    
    UIImagePickerController *imagePickV=[[UIImagePickerController alloc] init];
    imagePickV.sourceType=type;
    imagePickV.delegate=self;
    [self presentViewController:imagePickV animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *photo=info[UIImagePickerControllerOriginalImage];
    
    [self.photosView addPhoto:photo];
}


@end
