//
//  IndexedTableView.h
//  IndexedBar
//
//  Created by Yi Zhang on 2019/3/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexedTableViewDataSource <NSObject>

- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView;

@end

@interface IndexedTableView : UITableView
@property (nonatomic, weak) id<IndexedTableViewDataSource> indexedDataSource;
@end

NS_ASSUME_NONNULL_END
