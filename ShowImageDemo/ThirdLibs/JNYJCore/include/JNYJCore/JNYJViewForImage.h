//
//  JNYJViewForImage.h
//  ShowImageDemo
//
//  Created by William on 10/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Url_temp @"http://www.7qiao.com/media/download.do?id=e3d9a9d0b6134e859554fe1dbda39fa5"

@protocol  JNYJViewForImageDelegate <NSObject>

-(void)callback_tapView:(id)sender;

@end



@interface JNYJViewForImage : UIView<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    CGFloat floatScale;
    CGFloat floatOriginWidth;
    CGFloat floatOriginHeight;
    
    CGFloat floatOriginWidth_Space;
    CGFloat floatOriginHeight_Space;
    
    UITapGestureRecognizer *_tapGestureRecognizer;
}

@property(nonatomic,strong)UIView *viewBG;

@property(nonatomic,strong)NSString *urlOfImage;

@property(nonatomic,strong)UIScrollView *scrollViewContents;
@property(nonatomic,strong)UIImageView  *imageViewContents;
//
@property(nonatomic,weak)id<JNYJViewForImageDelegate> delegate_callBack;

-(void)configureView;

-(void)showImage:(UIImage *)image;
-(void)showImageWithUrl:(NSString *)url;
@end
