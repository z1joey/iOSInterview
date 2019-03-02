//
//  MObject.m
//  KVO_TEST
//
//  Created by Yi Zhang on 2019/3/2.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "MObject.h"

@implementation MObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

- (void)increase
{
    // 手动kvo
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

//- (void)setValue:(int)value
//{
//    NSLog(@"%d", value);
//}

@end
