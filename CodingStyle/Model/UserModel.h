//
//  UserModel.h
//  CodingStyle
//
//  Created by Yi Zhang on 2019/2/28.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 enum建议使用NS_ENUM和NS_OPTIONS
 应该在类，typedef宏命名时加入前缀（尤其大项目）
 */
typedef NS_ENUM(NSUInteger, ZYGender)
{
    ZYGenderMan,
    ZYGenderWoman,
    ZYGenderOthers
};

@interface UserModel : NSObject<NSCopying>
/**
 应该使用Foundation数据类型，比如 unsigned->NSUInteger
 字符串值可能发生改变，所以内存管理语义声明为copy
 用初始化方法设置初始值，所以读写语义为readonly
 语义排列顺序：原子性，读写，内存管理
 */
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, assign) NSUInteger age;
@property (nonatomic, readonly, assign) ZYGender gender;


/**
 designated:初始化所有参数
 secondary:初始化一个或多个，并提供默认值
 返回值最好是instancetype类型
 */
- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age gender:(ZYGender)gender;
- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age;
+ (instancetype)userWithName:(NSString *)name age:(NSUInteger)age gender:(ZYGender)gender;

@end

NS_ASSUME_NONNULL_END
