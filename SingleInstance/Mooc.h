//
//  Mooc.h
//  SingleInstance
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Mooc : NSObject

+ (id)sharedInstance;

@end

NS_ASSUME_NONNULL_END
