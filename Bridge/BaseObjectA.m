//
//  BaseObjectA.m
//  Bridge
//
//  Created by Yi Zhang on 2019/3/5.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "BaseObjectA.h"

@implementation BaseObjectA

- (void)handle
{
    // to be overrided
    [self.objB fetchData];
}

@end
