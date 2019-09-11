//
//  QXHFuLiMyAllViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHFuLiMyAllViewController.h"
#import "QXHMyFuLiNoTiJiaoCell.h"
#import "QXHMyFuLiModel.h"

@interface QXHFuLiMyAllViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@property (nonatomic, assign) NSInteger page;
@end

@implementation QXHFuLiMyAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.goodsModels = [NSMutableArray array];
    [self requestData];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.tableView];

    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        NSLog(@"上啦加载");
        self.page ++;
        [self requestData];
    }];
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
//我的福利任务
- (void)requestData{
    NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    [PPHTTPRequest myFuLiRenWuWithParameters:@{@"is_team":@"0",@"page":NewPage} success:^(Response *response) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.goodsModels removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHMyFuLiModel *model = [QXHMyFuLiModel mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 19, SCREEN_WIDTH, SCREEN_HEIGHT-64)
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
        //品牌分类上方的几个按钮
        [_tableView registerClass:[QXHMyFuLiNoTiJiaoCell class] forCellReuseIdentifier:@"QXHMyFuLiNoTiJiaoCell"];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 83;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHMyFuLiNoTiJiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyFuLiNoTiJiaoCell"];
    [cell bindGoodsModel:self.goodsModels[indexPath.row]];
    return cell;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, -100, SCREEN_WIDTH, 200)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}
@end

