//
//  HashFind.m
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "HashFind.h"

@implementation HashFind

char findFirstChar(char* cha)
{
    char result = '\0';
    int array[256];
    
    // 初始化
    for (int i=0; i<256; i++) {
        array[i] = 0;
    }
    
    // 定义指针p，使其指向字符串头部
    char *p = cha;
    while (*p != '\0') {
        array[*(p++)]++;
    }
    
    p = cha;
    while (*p != '\0') {
        if (array[*p] == 1) {
            result = *p;
            break;
        }
        p++;
    }

    return result;
}

@end
