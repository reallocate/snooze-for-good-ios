#import "ObjCSingleton.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation ObjCSingleton

NSMutableDictionary *sharedInstances;

+ (id)sharedInstance {

    id _sharedInstance = nil;
    if (sharedInstances == nil ) {
        sharedInstances = [[NSMutableDictionary alloc] init];
    }

#if (TARGET_OS_IPHONE)
    NSString *className = [self className];
#else
	NSString* className = NSStringFromClass( [self class] );
#endif
    _sharedInstance = [sharedInstances objectForKey:className];

    if (_sharedInstance == nil) {
        _sharedInstance = [super new];
        [sharedInstances setObject:_sharedInstance forKey:className];
    }
    return _sharedInstance;
}


#if (TARGET_OS_IPHONE)

- (NSString *)className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}

+ (NSString *)className {
    return [NSString stringWithUTF8String:class_getName(self)];
}

#endif


@end