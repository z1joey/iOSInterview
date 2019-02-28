//
//  UserModel.m
//  CodingStyle
//
//  Created by Yi Zhang on 2019/2/28.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
{
    NSMutableSet *_friends;
}

- (void)setName:(NSString *)name
{
    // 不需要再setter中加入 if(_obj != newObj)
    _name = [name copy];
}

#pragma mark - 初始化方法
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
    return [self initWithName:name age:age gender:ZYGenderNone];
}

+ (instancetype)userWithName:(NSString *)name age:(NSUInteger)age gender:(ZYGender)gender
{
    return nil;
}

#pragma mark - Add/Remove Friends
- (void)addFriend:(UserModel *)user
{
    [_friends addObject:user];
}

- (void)removeFriend:(UserModel *)user
{
    [_friends removeObject:user];
}

#pragma mark - NSCopying协议方法
/**
 让对象具有拷贝功能需要实现NSCopying或NSMutableCopying协议
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone
{
    UserModel *copy = [[[self class] allocWithZone:zone] initWithName:_name age:_age gender:_gender];
    // ->私有变量
    copy->_friends = [_friends mutableCopy];
    return copy;
}

- (id)deepCopy
{
    UserModel *copy = [[[self class] alloc] initWithName:_name age:_age gender:_gender];
    copy->_friends = [[NSMutableSet alloc] initWithSet:_friends copyItems:YES];
    return copy;
}

@end
