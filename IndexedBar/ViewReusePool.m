//
//  ViewReusePool.m
//  IndexedBar
//
//  Created by Yi Zhang on 2019/3/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()

@property (nonatomic, strong) NSMutableSet *waitUsedQueue;
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end

@implementation ViewReusePool

- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReusableView
{
    UIView *view = [_waitUsedQueue anyObject];
    // 如果为nil则没有可重用的对象
    if (view == nil) {
        return nil;
    }
    else {
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)addUsingView:(UIView *)view
{
    if (view == nil) {
        return;
    }
    [_usingQueue addObject:view];
}

- (void)reset
{
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        [_usingQueue removeObject:view];
        [_waitUsedQueue addObject:view];
    }
}

@end
