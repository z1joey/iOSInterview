//
//  Command.h
//  Command
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Command;

NS_ASSUME_NONNULL_BEGIN

typedef void(^CommandCompletionCallBack)(Command *cmd);

@interface Command : NSObject

@property (nonatomic, copy) CommandCompletionCallBack completion;

- (void)execute;
- (void)cancel;
- (void)done;

@end

NS_ASSUME_NONNULL_END
