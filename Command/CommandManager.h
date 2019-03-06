//
//  CommandManager.h
//  Command
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandManager : NSObject

@property (nonatomic, strong) NSMutableArray <Command *> *arrayCommands;

+ (instancetype)sharedInstance;

+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion;
+ (void)cancelCommand:(Command *)cmd;

@end

NS_ASSUME_NONNULL_END
