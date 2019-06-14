//
//  NSMutableDictionary+Null.m
//  SafeArray
//
//  Created by 兵伍 on 2019/5/26.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "NSMutableDictionary+__Safe__.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary(__Safe__)
#if !DEBUG
+ (void)methodSwizzleWithClass:(Class)c originalSEL:(SEL)originalSEL newSEL:(SEL)newSEL{
    Method origMethod = class_getInstanceMethod(c, originalSEL);
    Method newMethod = class_getInstanceMethod(c, newSEL);
    method_exchangeImplementations(origMethod, newMethod);
}

+ (void)load{
    [self methodSwizzleWithClass:objc_getClass("__NSDictionaryM")
                           originalSEL:@selector(setObject:forKey:)
                                newSEL:@selector(setNullObject:forKey:)];
}

- (void)setNullObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject && aKey) {
        [self setNullObject:anObject forKey:aKey];
    } else {
        NSLog(@"%s, object:%@, key:%@", __func__, anObject, aKey);
    }
}
#endif

@end
