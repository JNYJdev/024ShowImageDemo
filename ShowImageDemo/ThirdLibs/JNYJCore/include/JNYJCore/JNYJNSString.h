//
//  JNYJNSString.h
//  JNYJCore
//
//  Created by cotson on 14-7-2.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (JNYJ_JSON)

+(NSString *)JSON_dic:(NSDictionary *)dic;
+(NSDictionary *)dic_JSON:(NSString *)json;

@end
