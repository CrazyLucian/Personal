//
//  QXHYaoQingjILuViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHYaoQingjILuViewController.h"
#import "QXHYaoQingJiLuCell.h"
#import "QXHYaoQingHeadView.h"
#import "QXHYaoQingModels.h"
@interface QXHYaoQingjILuViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) QXHYaoQingHeadView *headerView;
@property (nonatomic, strong) NSNumber *today_num;
@property (nonatomic, strong) NSNumber *total_money;
@property (nonatomic, strong) NSNumber *total_num;
@property (nonatomic, strong) NSMutableArray *goodsModels;
@property (nonatomic, assign) NSInteger page;
@end

@implementation QXHYaoQingjILuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createNaviGational];
    [self requsetHttp];
    __weak QXHYaoQingjILuViewController *weakSelf = self;
    CustomRefreshGifHeader *header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
        weakSelf.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.view.userInteractionEnabled = YES;
            self.page = 1;
              [self requsetHttp];
            [weakSelf.tableView.mj_header endRefreshing];
        });
    }];
    self.tableView.mj_header = header;
    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        NSLog(@"上啦加载");
        self.page ++;
        [self requsetHttp];
    }];
 
    [self.view addSubview:self.tableView];
}
-(void)requsetHttp{
    [PPHTTPRequest yaoQingShouYiWithParameters:nil success:^(Response *response) {
        self.today_num = response.body[@"today_num"];
        self.total_money = response.body[@"total_money"];
        self.total_num = response.body[@"total_num"];
        self.headerView.allMoney.text = [NSString stringWithFormat:@"%@", self.total_money] ;
        self.headerView.todayPerson.text = [NSString stringWithFormat:@"%@", self.today_num] ;
        self.headerView.allPerson.text = [NSString stringWithFormat:@"%@", self.total_num] ;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
     NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    [PPHTTPRequest yaoQingListWithParameters:@{@"page":NewPage} success:^(Response *response) {
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.goodsModels removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHYaoQingModels *model = [QXHYaoQingModels mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
}
-(QXHYaoQingHeadView *)headerView{
    if (!_headerView) {
        _headerView = [[QXHYaoQingHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 285)];
  
    }
    return _headerView;
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
         _tableView.tableHeaderView = self.headerView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHYaoQingJiLuCell class] forCellReuseIdentifier:@"QXHYaoQingJiLuCell"];
        
    }
    return _tableView;
}
-(void)createNaviGational{
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"邀请记录";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    [self.view addSubview:topView];
}
-(void)goToJliView{
    
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 76;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHYaoQingJiLuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHYaoQingJiLuCell"];
    [cell congigUIWithModel:self.goodsModels[indexPath.row]];
    cell.backgroundColor  = [UIColor whiteColor];
    return cell;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]init];
    [view createWithTp:50];
    [self.view addSubview:view];
    return view;
}

@end
