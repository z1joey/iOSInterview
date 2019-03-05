//
//  BusinessObject.m
//  Responder
//
//  Created by Yi Zhang on 2019/3/5.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

- (void)handle:(ResultBlock)result
{
    CompletionBlock completion = ^(BOOL handled) {
        if (handled) {
            result(self, handled);
        }
        else {
            if (self.nextBusiness) {
                [self.nextBusiness handle:result];
            }
            else {
                result(nil, NO);
            }
        }
    };
    
    // 当前业务逻辑
    [self handleBusiness:completion]
}

- (void)handleBusiness:(CompletionBlock)completion
{
    NSLog(@"业务逻辑处理");
}

@end
