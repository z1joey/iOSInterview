//
//  ViewReusePool.h
//  IndexedBar
//
//  Created by Yi Zhang on 2019/3/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject

- (UIView *)dequeueReusableView;
- (void)addUsingView:(UIView *)view;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
