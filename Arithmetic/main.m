//
//  main.m
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReverseList.h"
#import "MergeSortedList.h"
#import "HashFind.h"
#import "MedianFind.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //char ch[] = "hello,world";
        //char_reverse(ch);
        //printf("reverse result is %s\n", ch);
        
        //struct Node *head = constructList();
        //printList(head);
        //printf("---------\n");
        //struct Node *newHead = reverseList(head);
        //printList(newHead);
        
//        int a[5] = {1,4,6,7,9};
//        int b[8] = {2,3,5,6,8,10,11,12};
//
//        int result[13];
//
//        mergeList(a, 5, b, 8, result);
//        printf("merge result is ");
//        for (int i = 0; i < 13; i++) {
//            printf("%d ", result[i]);
//        }
        
        //char cha[] = "abaccdeff";
        //char fc = findFirstChar(cha);
        //printf("this char is %c \n", fc);
        
        int list[9] = {12,3,10,8,6,7,11,13,9};
        int median = findMedian(list, 9);
        printf("the median is %d", median);
    }
        
    return 0;
}
