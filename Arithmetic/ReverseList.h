//
//  ReverseList.h
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct Node
{
    int data;
    struct Node *next;
};

@interface ReverseList : NSObject

// 链表反转
struct Node* reverseList(struct Node *head);
// 链表构造
struct Node* constructList(void);
// 链表打印
void printList(struct Node *head);

@end

NS_ASSUME_NONNULL_END
