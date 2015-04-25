//
//  JNYJLabel.h
//  RollLabel
//
//  Created by zhouxl on 12-11-2.
//  Copyright (c) 2012年 zhouxl. All rights reserved.
//

#define ROLL_LABEL_TAG 13032901L
#define ROLL_VIEW_TAG 13032902L


#define ROLL_VIEW_TAG2 1405280L
#define ROLL_VIEW_TAG3 1405281L
#define ROLL_VIEW_TAG4 1405282L


#import <UIKit/UIKit.h>

@protocol JNYJLabelDelegate;

#define kConstrainedSize CGSizeMake(10000, 40)//字体最大
@interface JNYJLabel : UIScrollView <UIScrollViewDelegate>
/*title,要显示的文字
 *color,文字颜色
 *font , 字体大小
 *superView,要加载标签的视图
 *rect ,标签的frame
 */
+ (void)JNYJLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font
			 superView:(UIView *)superView frame:(CGRect)rect;

+ (void)JNYJLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font
			 superView:(UIView *)superView frame:(CGRect)rect
			  delegate:(id<JNYJLabelDelegate>)delegate;

+ (CGSize)JNYJLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font
			 superView:(UIView *)superView frame:(CGRect)rect
			  delegate:(id<JNYJLabelDelegate>)delegate
				   tag:(NSInteger)tag;

+ (CGSize)JNYJLabelTitle:(NSString *)title attributedText:(NSMutableAttributedString *)text
				   color:(UIColor *)color
					font:(UIFont *)font
			   superView:(UIView *)superView frame:(CGRect)rect
				delegate:(id<JNYJLabelDelegate>)delegate
					 tag:(NSInteger)tag;

+ (UILabel *)JNYJLabelAttributeText:(NSString *)text color:(UIColor *)color font:(UIFont *)font
			   superView:(UIView *)superView frame:(CGRect)rect
				delegate:(id<JNYJLabelDelegate>)delegate
					 tag:(NSInteger)tag;
@property (nonatomic, assign) id<JNYJLabelDelegate>rollDelegate;

@end


@protocol JNYJLabelDelegate <NSObject>

@optional
// Called when JNYJLabel single tapped.
- (void)JNYJLabelTapped:(JNYJLabel *)roller;

@end