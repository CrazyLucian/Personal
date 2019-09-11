//
//  QXHMyTeamCardAllController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamCardAllController.h"
#import "QXHMyTeamCardTableViewCell.h"
#import "QXHMyCoardModels.h"
@interface QXHMyTeamCardAllController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation QXHMyTeamCardAllController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.listArray  = [[NSMutableArray alloc]init];
    [self requsetListArray];
    [self.view addSubview:self.tableView];
    __weak QXHMyTeamCardAllController *weakSelf = self;
    CustomRefreshGifHeader *header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
        weakSelf.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.view.userInteractionEnabled = YES;
            self.page = 1;
            [self requsetListArray];
            [weakSelf.tableView.mj_header endRefreshing];
        });
    }];
    self.tableView.mj_header = header;
    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        NSLog(@"上啦加载");
        self.page ++;
        [self requsetListArray];
    }];
    [self.tableView.mj_header beginRefreshing];
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT-120)
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
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //品牌分类上方的几个按钮
        [_tableView registerClass:[QXHMyTeamCardTableViewCell class] forCellReuseIdentifier:@"QXHMyTeamCardTableViewCell"];
    }
    return _tableView;
}
-(void)requsetListArray{
    //    //我的团队列表
    NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    NSString *newType = [NSString stringWithFormat:@"%@",self.type];
    [PPHTTPRequest myCardWithParameters:@{@"is_team":@"1",@"page":NewPage,@"status":newType} success:^(Response *response) {
//        sleep(3.0);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.listArray removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHMyCoardModels *model = [QXHMyCoardModels mj_objectWithKeyValues:dic];
            NSLog(@"modelmodel  %@",dic.mj_JSONString);
            [self.listArray addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 214;
}
//上拉加载卡顿 的时候 设置预计高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 214;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHMyTeamCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyTeamCardTableViewCell"];
    [cell configUIWithModel:self.listArray[indexPath.row]];
    cell.backgroundColor =RGBCOLOR(250, 250, 250);
    return cell;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}

@end
