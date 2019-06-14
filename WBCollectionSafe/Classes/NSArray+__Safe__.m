//
//  NSArray+Safe.m
//  BustVideo
//
//  Created by 兵伍 on 2019/5/26.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "NSArray+__Safe__.h"
#import <objc/runtime.h>


@implementation NSArray (Safe)
#if !DEBUG
+ (void)methodSwizzleWithClass:(Class)c originalSEL:(SEL)originalSEL newSEL:(SEL)newSEL{
    Method origMethod = class_getInstanceMethod(c, originalSEL);
    Method newMethod = class_getInstanceMethod(c, newSEL);
    method_exchangeImplementations(origMethod, newMethod);
}

+ (void)load
{
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArrayM")
                           originalSEL:@selector(objectAtIndex:)
                                newSEL:@selector(objectAtSafeIndex_M:)];
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArrayM")
                           originalSEL:@selector(objectAtIndexedSubscript:)
                                newSEL:@selector(objectAtIndexedSubscript_M:)];
    
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArrayI")
                           originalSEL:@selector(objectAtIndex:)
                                newSEL:@selector(objectAtSafeIndex_I:)];
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArrayI")
                           originalSEL:@selector(objectAtIndexedSubscript:)
                                newSEL:@selector(objectAtIndexedSubscript_I:)];
    
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArray0")
                           originalSEL:@selector(objectAtIndex:)
                                newSEL:@selector(objectAtSafeIndex_0:)];
    [self methodSwizzleWithClass:NSClassFromString(@"__NSArray0")
                           originalSEL:@selector(objectAtIndexedSubscript:)
                                newSEL:@selector(objectAtIndexedSubscript_0:)];
    
    
    [self methodSwizzleWithClass:NSClassFromString(@"__NSSingleObjectArrayI")
                     originalSEL:@selector(objectAtIndex:)
                          newSEL:@selector(objectAtSafeIndex_sigleI:)];
    [self methodSwizzleWithClass:NSClassFromString(@"__NSSingleObjectArrayI")
                     originalSEL:@selector(objectAtIndexedSubscript:)
                          newSEL:@selector(objectAtIndexedSubscript_sigleI:)];
    
}

- (id)objectAtSafeIndex_M:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtSafeIndex_M:index];
}

- (id)objectAtSafeIndex_I:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtSafeIndex_I:index];
}


- (id)objectAtIndexedSubscript_M:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtIndexedSubscript_M:index];
}

- (id)objectAtIndexedSubscript_I:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtIndexedSubscript_I:index];
}

- (id)objectAtSafeIndex_0:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtSafeIndex_0:index];
}

- (id)objectAtIndexedSubscript_0:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtIndexedSubscript_0:index];
}

- (id)objectAtSafeIndex_sigleI:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtSafeIndex_sigleI:index];
}

- (id)objectAtIndexedSubscript_sigleI:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"%s, index:%zd", __func__, index);
        return nil;
    }
    return [self objectAtIndexedSubscript_sigleI:index];
}
#endif

@end
