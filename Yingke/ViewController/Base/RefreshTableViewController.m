//
//  RefreshTableViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "RefreshTableViewController.h"
#import "RefreshTableHeaderView.h"
#import "RefreshTableFooterView.h"

#define DEFAULT_HEIGHT_OFFSET 52.0f
#define DEFAULT_FOOTERVIEW_HEIGHT 40.0

@interface RefreshTableViewController ()
{
    CGRect headerViewFrame;
}

@end

@implementation RefreshTableViewController

- (void)dealloc
{
    NSLog(@"RefreshTableViewController dealloc");
    
    self.dataSource = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    self.headerView = nil;
    self.footerView = nil;
    self.tableView = nil;
}

- (void)initialize
{
    self.pullToRefreshEnabled = YES;
    self.canLoadMore = YES;
    self.clearsSelectionOnViewWillAppear = YES;
    self.pageIndex = -1;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _dataSource;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        _tableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = kECECEC;
    }
    return _tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RefreshTableHeaderView" owner:self options:nil];
    RefreshTableHeaderView *headerView = (RefreshTableHeaderView *)[nib objectAtIndex:0];
    headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.headerView = headerView;
    
    if (self.canLoadMore) {
        nib = [[NSBundle mainBundle] loadNibNamed:@"RefreshTableFooterView" owner:self options:nil];
        RefreshTableFooterView *footerView = (RefreshTableFooterView *)[nib objectAtIndex:0];
        self.footerView = footerView;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.clearsSelectionOnViewWillAppear) {
        NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
        if (selected)
            [self.tableView deselectRowAtIndexPath:selected animated:animated];
    }
}

#pragma mark - tableView

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - set

- (void)setHeaderView:(UIView *)aView
{
    if (!self.tableView)
        return;
    
    if (_headerView && [_headerView isDescendantOfView:_tableView]) {
        [_headerView removeFromSuperview], self.headerView = nil;
    }
    
    if (aView) {
        _headerView = aView ;
        
        CGRect f = _headerView.frame;
        _headerView.frame = CGRectMake(f.origin.x, 0 - f.size.height, kScreenWidth, f.size.height);
        headerViewFrame = _headerView.frame;
        [self.tableView addSubview:_headerView];
    }
}

- (CGFloat)headerRefreshHeight
{
    return CGRectIsEmpty(headerViewFrame) ? DEFAULT_HEIGHT_OFFSET : headerViewFrame.size.height;
}

- (void)pinHeaderView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake([self headerRefreshHeight], 0, 0, 0);
    }];
    
    RefreshTableHeaderView *hv = (RefreshTableHeaderView *)self.headerView;
    [hv.loadingImageView startAnimating];
}

- (void)unpinHeaderView
{
    WEAKSELF
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.tableView.contentInset = UIEdgeInsetsZero;
    }];
    
    [[(RefreshTableHeaderView *)self.headerView loadingImageView] stopAnimating];
}

- (void)showRefreshHeaderView:(BOOL)animated
{
    self.tableView.contentInset = UIEdgeInsetsZero;
    [[(RefreshTableHeaderView *)self.headerView loadingImageView] stopAnimating];
    
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.contentInset = UIEdgeInsetsMake([self headerRefreshHeight], 0.0f, 0.0f, 0.0f);
            [self.tableView scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
        } completion:^(BOOL finished) {
            _isRefreshing = YES;
            self.pageIndex = -1;
            [self loadDataSource];
        }];
    } else {
        self.tableView.contentInset = UIEdgeInsetsMake([self headerRefreshHeight], 0.0f, 0.0f, 0.0f);
        [self.tableView scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
    }
    
    RefreshTableHeaderView *hv = (RefreshTableHeaderView *)self.headerView;
    [hv.loadingImageView startAnimating];
}

- (void)willBeginRefresh
{
    if (self.pullToRefreshEnabled) {
        [self pinHeaderView];
    }
}

- (void)willShowHeaderView:(UIScrollView *)scrollView
{
    
}

- (void)headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView
{
    
}

#pragma mark - 上啦

- (BOOL)refresh
{
    if (self.isRefreshing)
        return NO;
    
    [self initialize];
    [self willBeginRefresh];
    _isRefreshing = YES;
    
    self.isNotFirstLoading = YES;
    self.pageIndex = -1;
    [self loadDataSource];
    
    return YES;
}

- (void)refreshCompleted
{
    _isRefreshing = NO;
    if (_pullToRefreshEnabled)
        [self unpinHeaderView];
}

#pragma mark - 下拉

- (void)setFooterView:(UIView *)aView
{
    if (!self.tableView)
        return;
    
    if (aView) {
        self.tableView.tableFooterView = nil;
        _footerView = aView;
        _footerView.width = kScreenWidth;
        _tableView.tableFooterView = _footerView;
    }
}

- (void)willBeginLoadingMore
{
    RefreshTableFooterView *fv = (RefreshTableFooterView *)self.footerView;
    [fv.activityIndicator startAnimating];
    fv.infoLabel.hidden = YES;
}

- (void)loadMoreCompleted
{
    _isLoadingMore = NO;
    
    RefreshTableFooterView *fv = (RefreshTableFooterView *)self.footerView;
    [fv.activityIndicator stopAnimating];
    
    if (!self.canLoadMore) {
        fv.infoLabel.font = [UIFont systemFontOfSize:13.0];
        fv.infoLabel.hidden = NO;
    }
}

- (BOOL)loadMore
{
    if (_footerView == nil) {
        return NO;
    }
    
    if (_isLoadingMore) {
        return NO;
    }
    [self willBeginLoadingMore];
    _isLoadingMore = YES;
    
    [self loadDataSource];
    
    return YES;
}

- (CGFloat)footerLoadMoreHeight
{
    return self.footerView ? self.footerView.frame.size.height : DEFAULT_FOOTERVIEW_HEIGHT;
}

- (void)setFooterViewVisibility:(BOOL)visible
{
    if (visible && self.tableView.tableFooterView != self.footerView)
        self.tableView.tableFooterView = self.footerView;
    else if (!visible)
        self.tableView.tableFooterView = nil;
}

- (void)allLoadingCompleted
{
    if (_isRefreshing)
        [self refreshCompleted];
    if (_isLoadingMore)
        [self loadMoreCompleted];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_isRefreshing)
        return;
    _isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!_isRefreshing && _isDragging && scrollView.contentOffset.y < 0) {
        [self headerViewDidScroll:scrollView.contentOffset.y < 0 - [self headerRefreshHeight]
                       scrollView:scrollView];
    } else if (!_isLoadingMore && _canLoadMore) {
        
        CGFloat aHeight = scrollView.frame.size.height;
        
        if ((scrollView.contentOffset.y + aHeight
             >= scrollView.contentSize.height) && (scrollView.contentSize.height >= scrollView.frame.size.height)) {
            [self loadMore];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_isRefreshing)
        return;
    
    _isDragging = NO;
    if (scrollView.contentOffset.y <= 0 - [self headerRefreshHeight]) {
        if (_pullToRefreshEnabled)
            [self refresh];
    }
}

- (void)loadDataSource
{
    self.pageIndex++;
    if (self.pageIndex == 0) {
        if (_isRefreshing == NO) {
            if (self.dataSource.count == 0) {
                RefreshTableHeaderView *hv = (RefreshTableHeaderView *)self.headerView;
                if (hv.loadingImageView.isAnimating == NO && self.isNotFirstLoading == NO) {
                    if (self.canLoadMore == NO) {
                        self.tableView.tableFooterView = [[UIView alloc] init];
                    }
                }
            }
        }
    }
}

- (void)reloadTableViewDataWithModelsArray:(NSMutableArray *)listOfModelBaseObjects
{
    if (self.pageIndex == 0) {
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:listOfModelBaseObjects];
        [self refreshCompleted];
        if (_isRefreshing == NO && self.dataSource.count == 0) {
            self.tableView.tableFooterView.hidden = YES;
        } else {
            self.tableView.tableFooterView.hidden = NO;
        }
    } else {
        self.canLoadMore = (listOfModelBaseObjects.count == 0) ? NO : YES;
        [self.dataSource addObjectsFromArray:listOfModelBaseObjects];
        [self loadMoreCompleted];
    }
    
    [self.tableView reloadData];
}

@end
