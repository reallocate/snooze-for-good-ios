#import <Foundation/Foundation.h>

@interface ObjCSingleton : NSObject {
}

+ (id) sharedInstance;

#if (TARGET_OS_IPHONE)
- (NSString *)className;
+ (NSString *)className;
#endif

@end