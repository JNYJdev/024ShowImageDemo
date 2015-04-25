
#warning JNYJ KeyChain NEED ADD Security.framework
#import <Foundation/Foundation.h>

@interface JNYJKeyChain : NSObject

#pragma mark Save AND Store to Keychain.

+ (NSString *)getSecureValueForKey:(NSString *)key;
+ (BOOL)storeSecureValue:(NSString *)value forKey:(NSString *)key;
@end
