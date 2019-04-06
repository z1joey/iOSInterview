//
//  Person.m
//  Questions
//
//  Created by Yi Zhang on 2019/4/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
 不推荐在init方法中使用点语法，而应该使用下划线。因为self.ivar子类可能复写setter。
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lastName = @"";
        //NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([self class]));
        //NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, self.lastName);
    }
    return self;
}

- (void)setLastName:(NSString*)lastName
{
    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"根本不会调用这个方法");
    lastName = @"炎黄";
}

@end
