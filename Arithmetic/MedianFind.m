//
//  MedianFind.m
//  Arithmetic
//
//  Created by Yi Zhang on 2019/3/6.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "MedianFind.h"

@implementation MedianFind

int findMedian(int a[], int aLen)
{
    int low = 0;
    int high = aLen - 1;
    
    int mid = (aLen - 1) / 2;
    int div = PartSort(a, low, high);
    
    while (div != mid) {
        if (mid < div) {
            // 从前到后寻找
            div = PartSort(a, low, div - 1);
        }
        else {
            // 从后往前寻找
            div = PartSort(a, div + 1, high);
        }
    }
    
    return a[mid];
}

int PartSort(int a[], int start, int end)
{
    int low = start;
    int high = end;
    
    int key = a[end];
    
    while (low < high) {
        while (low < high && a[low] <= key) {
            ++low;
        }
        
        while (low < high && a[high] >= key) {
            --high;
        }
        
        if (low < high) {
            int temp = a[low];
            a[low] = a[high];
            a[high] = temp;
        }
    }
        
    int temp = a[high];
    a[high] = a[end];
    a[end] = temp;
    
    return low;
}

@end
