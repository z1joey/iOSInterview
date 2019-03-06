//
//  BaseObjectA.h
//  Bridge
//
//  Created by Yi Zhang on 2019/3/5.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObjectB.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseObjectA : NSObject

// 桥接模式核心
@property (nonatomic, strong) BaseObjectB *objB;

- (void)handle;

@end

NS_ASSUME_NONNULL_END
