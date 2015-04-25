
#import <Foundation/Foundation.h>

#warning   ------------------>Knowing<-------------  call categary method crashed  --> unrecognized selector sent to instance 0x7574190  JNYJbuild setting  fine "Other Linker Flags"  add "-ObjC" building and runing it is OK.

@interface JNYJColors : NSObject

+(NSMutableAttributedString *)attributedString:(NSString *)value
									   keywords:(NSArray *)keywords
										  color:(id)color;

+(NSMutableAttributedString *)attributedString:(NSString *)value
									  keywords:(NSArray *)keywords
										 color:(id)color
										  font:(id)font;

+(NSMutableAttributedString *)attributedString:(NSString *)value
							   keywords_groups:(NSArray *)keywords
								  color_groups:(NSArray *)colors
										  font_groups:(NSArray *)fonts;
@end
