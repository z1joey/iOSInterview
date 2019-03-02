//
//  MObject.h
//  KVO_TEST
//
//  Created by Yi Zhang on 2019/3/2.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MObject : NSObject

@property (nonatomic, assign) int value;

- (void)increase;

@end

NS_ASSUME_NONNULL_END
