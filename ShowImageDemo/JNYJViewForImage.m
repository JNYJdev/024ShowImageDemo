//
//  JNYJViewForImage.m
//  ShowImageDemo
//
//  Created by William on 10/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "JNYJViewForImage.h"


@implementation JNYJViewForImage

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    return self;
}
-(void)configureView{
    //
    CGRect rect_ = self.frame;
//    CGRect rect_s;
    UIView *view_ = [[UIView alloc] initWithFrame:CGRectMake(0,44,
                                                             rect_.size.width,
                                                             rect_.size.height-20-44)];
    //
    self.viewBG = view_;
    [self addSubview:view_];
    //
    rect_ = view_.frame;
    UIScrollView *scrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                               rect_.size.width,
                                                                               rect_.size.height)];
    self.scrollViewContents = scrollView_;
    [self.viewBG addSubview:scrollView_];
    [scrollView_ setBackgroundColor:[UIColor redColor]];
    [self.scrollViewContents setDelegate:self];
    self.scrollViewContents.minimumZoomScale = 1;
    self.scrollViewContents.maximumZoomScale = 50;
    [self.scrollViewContents setScrollEnabled:YES];
    //
    rect_ = scrollView_.frame;
    UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,
                                                                            rect_.size.width,
                                                                            rect_.size.height)];
    [scrollView_ addSubview:imageView_];
    self.imageViewContents = imageView_;
    [imageView_ setBackgroundColor:[UIColor blackColor]];
    //
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                    action:@selector(tap_self:)];
    [_tapGestureRecognizer setNumberOfTapsRequired:1];
    _tapGestureRecognizer.delegate = self;
    _tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.scrollViewContents addGestureRecognizer:_tapGestureRecognizer];
}
-(void)showImage:(UIImage *)image{
    if (image) {
        [self.imageViewContents setImage:image];
        [self fitAndFillImageView:self.scrollViewContents
                            image:self.imageViewContents.image];
    }
}
-(void)showImageWithUrl:(NSString *)url{
    if (url && ![url isEqualToString:@""]) {
        
        //开启一个多线程GCD
        dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);//创建一个队列
        //开启一个线程
        dispatch_async(queue1, ^{
            
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.imageViewContents setImage:image];
                [self fitAndFillImageView:self.scrollViewContents
                                    image:self.imageViewContents.image];
                //
                //
            });
        });
    }
}
//
-(void)fitAndFillImageView:(UIScrollView *)scrollView image:(UIImage *)image{
    
    if (floatScale >1.0) {
        return;
    }
    CGSize paramSize = image.size;
    CGSize paramSelfViewSize = scrollView.frame.size;
    CGFloat widthScale = scrollView.frame.size.width/paramSize.width;
    CGFloat heightScale = scrollView.frame.size.height/paramSize.height;
    CGRect paramRect;
    CGFloat paramWidth;
    CGFloat paramHeight;
    if (widthScale>1 && heightScale >1) {
        paramRect = CGRectMake((paramSelfViewSize.width - paramSize.width)/2, (paramSelfViewSize.height - paramSize.height)/2, paramSize.width ,paramSize.height);
    }else if (widthScale<1 || heightScale<1){
        if (heightScale>=widthScale) {
            paramWidth = paramSize.width*widthScale;
            paramHeight = paramSize.height*widthScale;
            paramRect = CGRectMake((paramSelfViewSize.width - paramWidth)/2, (paramSelfViewSize.height - paramHeight)/2, paramWidth ,paramHeight);
        }else{
            paramWidth = paramSize.width*heightScale;
            paramHeight = paramSize.height*heightScale;
            paramRect = CGRectMake((paramSelfViewSize.width - paramWidth)/2, (paramSelfViewSize.height - paramHeight)/2, paramWidth ,paramHeight);
        }
    }else{
        paramRect = CGRectMake(0,0,paramSelfViewSize.width,paramSelfViewSize.height);
    }
    [self.imageViewContents setFrame:paramRect];
    //
    
    floatOriginWidth = paramRect.size.width;
    floatOriginHeight = paramRect.size.height;
    
    floatOriginWidth_Space = paramSelfViewSize.width - paramRect.size.width;
    floatOriginHeight_Space = paramSelfViewSize.height - paramRect.size.height;
}
-(void)tap_self:(id)sender{
    if ([self.delegate_callBack respondsToSelector:@selector(callback_tapView:)]) {
        [self.delegate_callBack callback_tapView:nil];
    }
}
#pragma mark Scrollview delegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageViewContents;
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    floatScale=scale;
    [self.scrollViewContents setContentSize:
     CGSizeMake(
                floatOriginWidth*scale+floatOriginWidth_Space,
                floatOriginHeight*scale+floatOriginHeight_Space)];
//    //if scale to origin that need to set view content center.
//    if (floatScale<=1.0) {
////        [self setViewFrame:self.frame];
//    }
}

@end
