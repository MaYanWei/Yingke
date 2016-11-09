//
//  LiveListTableViewController.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "LiveListTableViewController.h"
#import "LiveListCell.h"

@interface LiveListTableViewController ()

@end

@implementation LiveListTableViewController

#pragma mark - Life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.canLoadMore = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadDataSource];
}

#pragma mark - TableView delegate、dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiveListItem *item = [self.dataSource objectNilAtIndex:indexPath.row];
    CGFloat cellHegiht = [LiveListCell cellHeightForItem:item];
    return cellHegiht;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    LiveListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LiveListCell" owner:nil options:nil] lastObject];
    }

    LiveListItem *item = [self.dataSource objectNilAtIndex:indexPath.row];
    [cell bindItem:item];
    
    return cell;
}

#pragma mark - Network

- (void)loadDataSource
{
    [super loadDataSource];
    
    [RequestManager requestLiveListOnSucceeded:^(NSMutableArray *models) {
        [self reloadTableViewDataWithModelsArray:models];
    } onError:^(NSInteger code, NSString *message) {
        
    }];
}

@end
