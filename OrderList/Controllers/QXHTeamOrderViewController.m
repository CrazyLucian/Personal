//
//  QXHTeamOrderViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHTeamOrderViewController.h"
#import "QXHMyOrderTableViewCell.h"
#import "QXHMyOrderModels.h"
#import "QXHTeamOrderTableViewCell.h"
@interface QXHTeamOrderViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@property (nonatomic, assign) NSInteger page;
@end

@implementation QXHTeamOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.goodsModels = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.tableView];
    [self requestData];
    //默认block方法：设置下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        self.page = 1;
        [self requestData];
    }];
    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        NSLog(@"上啦加载");
        self.page ++;
        [self requestData];
    }];
}
//订单
- (void)requestData{
    NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    [PPHTTPRequest myOrderWithParameters:@{@"is_team":@"1",@"page":NewPage} success:^(Response *response) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.goodsModels removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHMyOrderModels *model = [QXHMyOrderModels mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 19, SCREEN_WIDTH, SCREEN_HEIGHT-100)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHTeamOrderTableViewCell class] forCellReuseIdentifier:@"QXHTeamOrderTableViewCell"];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 186;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHTeamOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHTeamOrderTableViewCell"];
    [cell bindGoodsModel:self.goodsModels[indexPath.row]];
    return cell;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}
@end
