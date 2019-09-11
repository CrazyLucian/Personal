//
//  QXHCheckJiLuViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCheckJiLuViewController.h"
#import "QXHCheckJiLuTableViewCell.h"
#import "QXHCheckInModel.h"

@interface QXHCheckJiLuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation QXHCheckJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航控制器的代理为self
    self.page = 1;
    self.listArray = [NSMutableArray array];
    [self setupNavBar];
     [self requestData];
//    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.tableView];
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
#pragma mark - UINavigationControllerDelegate

-(void)requestData{
    // 进行网络请求
    NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    [PPHTTPRequest checkInListWithParameters:@{@"page":NewPage,@"type":@"4"} success:^(Response *response) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.listArray removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHCheckInModel *model = [QXHCheckInModel mj_objectWithKeyValues:dic];
            [self.listArray addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}
- (void)setupNavBar {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor  whiteColor];
    [self.view addSubview:view];
    
    UIButton * leftBackButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 32, 30, 30)];
    [leftBackButton setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [leftBackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftBackButton];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(151, 31, 150, 17)];
    lable.text =@"签到记录";
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:18];
    [view addSubview:lable];
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
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
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //品牌分类上方的几个按钮
        [_tableView registerClass:[QXHCheckJiLuTableViewCell class] forCellReuseIdentifier:@"QXHCheckJiLuTableViewCell"];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHCheckJiLuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHCheckJiLuTableViewCell"];
    [cell configUIWithModel:self.listArray[indexPath.row]];
    cell.backgroundColor =RGBCOLOR(250, 250, 250);
    return cell;
}
@end
