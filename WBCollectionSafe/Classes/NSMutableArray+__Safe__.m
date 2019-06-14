//
//  NSMutableArray+nil.m
//  SafeArray
//
//  Created by 兵伍 on 2019/5/26.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "NSMutableArray+__Safe__.h"
#import <objc/runtime.h>

@implementation NSMutableArray(__Safe__)
#if !DEBUG
+ (void)methodSwizzleWithClass:(Class)c originalSEL:(SEL)originalSEL newSEL:(SEL)newSEL{
    Method origMethod = class_getInstanceMethod(c, originalSEL);
    Method newMethod = class_getInstanceMethod(c, newSEL);
    method_exchangeImplementations(origMethod, newMethod);
}

+ (void)load{
    [self methodSwizzleWithClass:objc_getClass("__NSArrayM")
                     originalSEL:@selector(insertObject:atIndex:)
                          newSEL:@selector(insertNullObject:atIndex:)];
}

- (void)insertNullObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject) {
        [self insertNullObject:anObject atIndex:index];
    } else {
        NSLog(@"%s, object:%@", __func__, anObject);
    }
}
#endif

@end
