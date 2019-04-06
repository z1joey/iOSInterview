//
//  UserCenter.m
//  Barrier
//
//  Created by Yi Zhang on 2019/3/4.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "UserCenter.h"

@interface UserCenter ()
{
    // 定义一个并发队列
    dispatch_queue_t concurrent_queue;
    // 用户数据中心，可能多个线程需要访问数据
    NSMutableDictionary *userCenterDic;
}
@end

@implementation UserCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        concurrent_queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        userCenterDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)objectForKey:(NSString *)key
{
    __block id obj;
    // 同步读取指定数据，保证其他线程可以同时调用
    dispatch_sync(concurrent_queue, ^{
        obj = [userCenterDic objectForKey:key];
    });
    
    return obj;
}

- (void)setObject:(id)obj forKey:(NSString *)key
{
    // 异步栅栏调用设置数据
    dispatch_barrier_async(concurrent_queue, ^{
        [userCenterDic setObject:obj forKey:key];
    });
}

@end
