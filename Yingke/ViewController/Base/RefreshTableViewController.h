//
//  RefreshTableViewController.h
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseViewController.h"

@interface RefreshTableViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) BOOL isDragging;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) BOOL isNotFirstLoading;
@property (nonatomic, assign) BOOL isLoadingMore;
@property (nonatomic, assign) BOOL canLoadMore;

@property (nonatomic, assign) BOOL pullToRefreshEnabled;

// 默认yes
@property (nonatomic, assign) BOOL clearsSelectionOnViewWillAppear;

@property (nonatomic, assign) int pageIndex;

- (void)initialize;

- (CGFloat)footerLoadMoreHeight;
- (BOOL)loadMore;
- (void)willBeginLoadingMore;
- (void)loadMoreCompleted;
- (void)setFooterViewVisibility:(BOOL)visible;

- (void)refreshCompleted;
- (void)allLoadingCompleted;

- (void)loadDataSource;

- (void)reloadTableViewDataWithModelsArray:(NSMutableArray *)listOfModelBaseObjects;

@end
