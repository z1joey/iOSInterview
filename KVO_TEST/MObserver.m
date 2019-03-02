//
//  MObserver.m
//  KVO_TEST
//
//  Created by Yi Zhang on 2019/3/2.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "MObserver.h"
#import "MObject.h"

@implementation MObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isKindOfClass:[MObject class]] && [keyPath isEqualToString:@"value"]) {
        NSNumber *valueNum = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value is %@", valueNum);
    }
}

@end
