//
//  IndexedTableView.m
//  IndexedBar
//
//  Created by Yi Zhang on 2019/3/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView ()
{
    UIView *containerView;
    ViewReusePool *reusePool;
}
@end

@implementation IndexedTableView

- (void)reloadData
{
    [super reloadData];
    
    if (containerView == nil) {
        NSLog(@"containerView == nil");
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
        
        // 避免索引条随着tableview滚动
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    
    if (reusePool == nil) {
        NSLog(@"reusePool == nil");
        reusePool = [[ViewReusePool alloc] init];
    }
    
    // 标记所有视图为可重用状态
    [reusePool reset];
    
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar
{
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        NSLog(@"Responds to indexTitlesForIndexTableView");
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    
    if (!arrayTitles || arrayTitles.count <= 0) {
        NSLog(@"ContainerView setHidden YES");
        [containerView setHidden:YES];
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (int i = 0; i < [arrayTitles count]; i++) {
        NSString *titl = [arrayTitles objectAtIndex:i];
        UIButton *button = (UIButton *)[reusePool dequeueReusableView];
        
        if (button == nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            // 注册button到重用池
            [reusePool addUsingView:button];
            NSLog(@"新建了一个button");
        }
        else {
            NSLog(@"重用 button");
        }
        
        [containerView addSubview:button];
        [button setTitle:titl forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];
    }
    
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}

@end
