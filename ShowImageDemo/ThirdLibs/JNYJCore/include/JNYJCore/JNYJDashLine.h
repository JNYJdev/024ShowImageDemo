//
//  JNYJDashLine.h
//  JNYJCore
//
//  Created by William on 14-5-10.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNYJDashLine : UIView
@property (nonatomic, assign) CGFloat		float_dash_line_thickness;
@property (nonatomic, assign) CGFloat 		float_dash_width_line;
@property (nonatomic, assign) CGFloat 		float_dash_width_line_clear;
@property (nonatomic, strong) UIColor			*color_dash_line;

-(void)configureLine;
@end
