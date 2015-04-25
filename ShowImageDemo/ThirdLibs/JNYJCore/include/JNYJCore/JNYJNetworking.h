//  InterfaceCaller.h




#import <Foundation/Foundation.h>

@class JNYJNetworking;

@protocol JNYJNetworkingDelegate <NSObject>
- (void)InterfaceCaller:(JNYJNetworking *)caller EndWithData:(NSObject*)data;
@end

@interface JNYJNetworking : NSObject <NSURLConnectionDataDelegate>{
    id<JNYJNetworkingDelegate> delegate_networking;
    NSMutableData               *receivedData;
}
@property (nonatomic, assign) id<JNYJNetworkingDelegate>   delegate_networking;
@property (nonatomic, retain) NSMutableData                 *receivedData;

+ (JNYJNetworking *)RequestService:(NSString *)serviceURLPath andDelegate:(id)delegate;
@end
