//
//  CopyTest.m
//  Questions
//
//  Created by Yi Zhang on 2019/4/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "CopyTest.h"

@interface CopyTest ()

@property (nonatomic, readwrite, strong) NSArray *array;

@end

@implementation CopyTest

- (void)test
{
    NSArray *array = @[@1, @2, @3, @4];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    
    self.array = mutableArray;
    [mutableArray removeAllObjects];
    NSLog(@"%@", self.array); // 空
    
    [mutableArray addObjectsFromArray:array];
    self.array = [mutableArray copy];
    [mutableArray removeAllObjects];
    NSLog(@"%@", self.array); // 1, 2, 3, 4
}

@end
