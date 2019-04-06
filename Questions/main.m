//
//  main.m
//  Questions
//
//  Created by Yi Zhang on 2019/4/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Copy/CopyTest.h"
#import "Self/ChenPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //CopyTest *ct = [[CopyTest alloc] init];
        //[ct test];
        
        ChenPerson *cp = [[ChenPerson alloc] init];
        cp.lastName = @"张某某";
        //Person *p = [[Person alloc] init];
    }
    return 0;
}
