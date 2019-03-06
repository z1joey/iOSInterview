//
//  CoolTarget.h
//  Adapter
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"

NS_ASSUME_NONNULL_BEGIN

// 适配对象
@interface CoolTarget : NSObject

@property (nonatomic, strong) Target *target;

- (void)request;

@end

NS_ASSUME_NONNULL_END
