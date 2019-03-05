//
//  main.m
//  Block
//
//  Created by Yi Zhang on 2019/3/4.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // int multiplier = 6;
        static int multiplier = 6;
        int(^Block)(int) = ^int(int num)
        {
            return num * multiplier;
        };
        // Block申明后再更改局部变量不会有影响，除非是静态变量
        // 以指针形式截获局部静态变量
        multiplier = 4;
        NSLog(@"result is %d", Block(2));
    }
    return 0;
}

//- (void)method
//{
//    int multiplier = 6;
//    int(^Block)(int) = ^int(int num)
//    {
//        return num * multiplier;
//    };
//    multiplier = 4;
//    NSLog(@"result is %d", Block(2));
//}
