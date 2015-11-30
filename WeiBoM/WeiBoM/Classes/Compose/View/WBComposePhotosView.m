// 
// WBComposePhotosView.m
//
// IDECodeSnippetIdentifier: 75E75CFB-9617-487F-B074-6A7539DD169C
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1

#import "WBComposePhotosView.h"

@interface WBComposePhotosView()

@end

@implementation WBComposePhotosView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _photos=[NSMutableArray array];
    }
    return self;
}

-(void)addPhoto:(UIImage *)photo
{
    UIImageView *photoView=[[UIImageView alloc] init];
    photoView.image=photo;
    [self addSubview:photoView];
    [_photos addObject:photo];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count=self.subviews.count;
    CGFloat photoViewWH=70;
    CGFloat photoViewMargin=10;
    
    for (int i=0; i< count; i++) {
        UIImageView *photoView=self.subviews[i];
        photoView.x= i % 4 * (photoViewWH + photoViewMargin);
        photoView.y= i / 4 * (photoViewWH + photoViewMargin);
        photoView.width=photoViewWH;
        photoView.height=photoViewWH;
        
    }
    
}



@end
