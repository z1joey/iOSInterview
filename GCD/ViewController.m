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
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    // 主队列中的viewDidLoad同步提交任务到串行队列
    dispatch_sync(serialQueue, ^{
        [self doSomething];
    });

}

- (void)doSomething
{
    NSLog(@"do");
}


@end
