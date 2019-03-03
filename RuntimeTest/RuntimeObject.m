//
//  RuntimeObject.m
//  RuntimeTest
//
//  Created by Yi Zhang on 2019/3/2.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>

@implementation RuntimeObject

void testImp (void)
{
    NSLog(@"test invoke");
}

//#pragma mark - Method Swizzling
//+ (void)load
//{
//    // 获取两个方法的方法结构体
//    Method test = class_getInstanceMethod(self, @selector(test));
//    Method otherTest = class_getInstanceMethod(self, @selector(otherTest));
//    // 交换两个方法的实现
//    method_exchangeImplementations(test, otherTest);
//}
//
//- (void)test
//{
//    NSLog(@"test");
//}
//
//- (void)otherTest
//{
//    // otherTest实际上是test
//    [self otherTest];
//    NSLog(@"otherTest");
//}

#pragma mark - 消息转发
/**
 消息转发
 1. 实例方法调用 resolveInstanceMethod
    类方法调用 resolveClassMethod
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod:");
        
        // 如果方法没实施，则动态添加方法
        class_addMethod(self, @selector(test), testImp, "v@:");
        
        return NO;
    }
    else {
        return [super resolveInstanceMethod:sel];
    }
}


/**
 2. 如果返回NO，调用forwardingTargetForSelector
 */
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"forwardingTargetForSelector:");
    return nil;
}


/**
  3. forwardingTargetForSelector返回nil，则调用methodSignatureForSelector
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        // v for void, @ for self, : for selector
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    else {
        return [super methodSignatureForSelector:aSelector];
    }
}


/**
 4. 如果第3步不为nil，则调用forwardInvocation
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation:");
}

@end
