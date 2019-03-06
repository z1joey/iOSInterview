//
//  Command.m
//  Command
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "Command.h"

@implementation Command

- (void)execute
{
    //override
    [self done];
}

- (void)cancel
{
    self.completion = nil;
}

- (void)done
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_completion) {
            _completion(self);
        }
        // 避免循环
        self.completion = nil;
        //commandm
    })
}

@end
