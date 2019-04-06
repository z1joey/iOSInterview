//
//  ViewController.m
//  GCD
//
//  Created by Yi Zhang on 2019/3/30.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    在主队列有两个任务，但是Block要等viewDidLoad完成才能执行（先进先出）
    //    dispatch_sync(dispatch_get_main_queue(), ^{
    //        [self doSomething];
    //    });
    
    //    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    //    主队列中的viewDidLoad同步提交任务到串行队列
    //    dispatch_sync(serialQueue, ^{
    //        [self doSomething];
    //    });
    
    /*
     只要是同步提交，就在当前线程执行
     */
    //    NSLog(@"1");
    //    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        NSLog(@"2");
    //        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //            NSLog(@"3");
    //        });
    //        NSLog(@"4");
    //    });
    //    NSLog(@"5");
    
    // 异步串行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"1");
        // 没有runloop, selector失效
        [self performSelector:@selector(doSomething) withObject:nil afterDelay:0];
        NSLog(@"3");
    });
}

- (void)doSomething
{
    NSLog(@"do");
}


@end
