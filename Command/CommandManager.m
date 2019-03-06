//
//  CommandManager.m
//  Command
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "CommandManager.h"

@implementation CommandManager

+ (instancetype)sharedInstance
{
    static CommandManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayCommands = [NSMutableArray array];
    }
    return self;
}

+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion
{
    if (cmd) {
        if (![self _isExecutingCommand:cmd]) {
            [[[self sharedInstance] arrayCommands] addObject:cmd];
            cmd.completion = completion;
            [cmd execute];
        }
    }
}

+ (void)cancelCommand:(Command *)cmd
{
    if (cmd) {
        [[[self sharedInstance] arrayCommands] removeObject:cmd];
        [cmd cancel];
    }
}

+ (BOOL)_isExecutingCommand:(Command *)cmd
{
    if (cmd) {
        NSArray *cmds = [[self sharedInstance] arrayCommands];
        for (Command *aCmd in cmds) {
            if (cmd == aCmd) {
                return YES;
            }
        }
    }
    return NO;
}

@end
