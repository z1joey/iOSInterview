//
//  BridgeDemo.m
//  Bridge
//
//  Created by Yi Zhang on 2019/3/5.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "BridgeDemo.h"

#import "ObjectA1.h"
#import "ObjectA2.h"
#import "ObjectB1.h"
#import "ObjectB2.h"

@interface BridgeDemo ()
@property (nonatomic, strong) BaseObjectA *objA;
@end

@implementation BridgeDemo

- (void)fetch
{
    _objA = [[ObjectA1 alloc] init];
    
    BaseObjectB *b1 = [[ObjectB1 alloc] init];
    _objA.objB = b1;
    
    [_objA handle];
}

@end
