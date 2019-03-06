//
//  Mooc.m
//  SingleInstance
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "Mooc.h"

@implementation Mooc

+ (id)sharedInstance
{
    static Mooc *instance = nil;

    // 确认在多线程下，instance只创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 用super不用self是为了避免死循环
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 必不可少，避免外界避过单例方法创建对象
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    return self;
}

@end
