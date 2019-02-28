//
//  IncorrectUserModel.h
//  CodingStyle
//
//  Created by Yi Zhang on 2019/2/28.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 避免混用驼峰法和下划线法
// 左括号前加空格或者换行，右括号后加空格
// 冒号两侧都加空格
typedef enum :NSUInteger{
    UserSex_Man,
    UserSex_Woman
}UserSex;

@interface IncorrectUserModel : NSObject

@property(nonatomic, strong) NSString *name;
@property(assign, nonatomic) int age;
@property(nonatomic, assign) UserSex sex;

// -后面应有空格
-(id)initUserModelWithUserName: (NSString *)name withAge:(int)age;

-(void)doLogIn;

@end

NS_ASSUME_NONNULL_END
