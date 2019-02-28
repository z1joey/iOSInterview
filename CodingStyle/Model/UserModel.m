//
//  UserModel.m
//  CodingStyle
//
//  Created by Yi Zhang on 2019/2/28.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


/**
 designated初始化方法
 */
- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age gender:(ZYGender)gender
{
    if (self = [super init]) {
        _name = [name copy];
        _age = age;
        _gender = gender;
    }
    return self;
}

/**
 secondary初始化方法
 */
- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age
{
    return [self initWithName:name age:age gender:nil];
}

@end
