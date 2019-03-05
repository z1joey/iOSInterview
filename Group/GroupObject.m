//
//  GroupObject.m
//  Group
//
//  Created by Yi Zhang on 2019/3/4.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "GroupObject.h"
#import <Foundation/Foundation.h>

@interface GroupObject ()
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
    dispatch_group_t group = dispatch_group_create();
    
    for (NSURL *url in arrayURLs) {
        dispatch_group_async(group, concurrent_queue, ^{
            NSLog(@"url is %@", url);
        })
    }
    
    // 完成group的任务以后才执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有图片已全部下载完成");
    })
}
@end
