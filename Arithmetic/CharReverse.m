//
//  CharReverse.m
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "CharReverse.h"

@implementation CharReverse

void char_reverse(char *cha)
{
    char *begin = cha;
    char *end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
}

@end
