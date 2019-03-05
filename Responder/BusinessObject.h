//
//  BusinessObject.h
//  Responder
//
//  Created by Yi Zhang on 2019/3/5.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BusinessObject;

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletionBlock) (BOOL handled);
typedef void(^ResultBlock) (BusinessObject *handler, BOOL handled);

@interface BusinessObject : NSObject

// 响应链构成关键
@property (nonatomic, strong) BusinessObject *nextBusiness;

// 责任链入口方法
- (void)handle:(ResultBlock)result;
- (void)handleBusiness:(CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
