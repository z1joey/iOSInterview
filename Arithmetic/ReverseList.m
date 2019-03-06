//
//  ReverseList.m
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "ReverseList.h"

@implementation ReverseList

struct Node* reverseList(struct Node *head)
{
    struct Node *p = head;
    struct Node *newH = NULL;
    
    while (p != NULL) {
        struct Node *temp = p->next;
        p->next = newH;
        newH = p;
        p = temp;
    }
    
    return newH;
}

struct Node* constructList(void)
{
    struct Node *head = NULL;
    struct Node *cur = NULL;
    
    for (int i = 1; i < 5; i++) {
        struct Node *node = malloc(sizeof(struct Node));
        node->data = i;
        
        if (head == NULL) {
            head = node;
        }
        else {
            cur->next = node;
        }
        
        cur = node;
    }
    
    return head;
}

void printList(struct Node *head)
{
    struct Node* temp = head;
    
    while (temp != NULL) {
        // TODO:这里会报错
        printf("node is %d \n", temp->data);
        temp = temp->next;
    }
}

@end
