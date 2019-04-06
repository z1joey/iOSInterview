//
//  GroupObject.m
//  GCD
//
//  Created by Yi Zhang on 2019/3/31.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "GroupObject.h"

@interface GroupObject()
{
    dispatch_queue_t concurrent_queue;
    NSMutableArray <NSURL *> *arrayURLs;
}
@end

@implementation GroupObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
        arrayURLs = [NSMutableArray array];
    }
    return self;
}

- (void)handle
{
    // group应该可以解决电商中的图片加载问题
    dispatch_group_t group = dispatch_group_create();
    for (NSURL *url in arrayURLs) {
        dispatch_group_async(group, concurrent_queue, ^{
            NSLog(@"url is %@", url);
        });
    }
    
    // 该函数立刻执行，但是block在组中所有任务完成后才执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有图片下载完成");
    });
}

@end
