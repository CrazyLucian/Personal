//
//  QXHMyCardAllViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardAllViewController.h"
#import "QXHMyCardTableViewCell.h"
//卡券详情
#import "QXHMyCardDetailViewController.h"
#import "QXHMyCardNoPayTableViewCell.h"
#import "QXHMyOrderModels.h"
#import "QXHMyCardModels.h"
@interface QXHMyCardAllViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *goodsModels;
@end

@implementation QXHMyCardAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.goodsModels = [[NSMutableArray alloc]init];
    [self.view addSubview:self.tableView];
    __weak QXHMyCardAllViewController *weakSelf = self;
    CustomRefreshGifHeader *header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
         [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
        weakSelf.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.view.userInteractionEnabled = YES;
            self.page = 1;
            [self requestData];
            [weakSelf.tableView.mj_header endRefreshing];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];
    self.tableView.mj_header = header;
    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        NSLog(@"上啦加载");
        self.page ++;
        [self requestData];
    }];
    [self.tableView.mj_header beginRefreshing];
}
//订单
- (void)requestData{
    NSString *NewPage = [NSString stringWithFormat:@"%ld",self.page];
    NSString *newType = [NSString stringWithFormat:@"%@",self.type];
    [PPHTTPRequest myCardWithParameters:@{@"is_team":@"0",@"page":NewPage,@"status":newType} success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.page == 1) {
            [self.goodsModels removeAllObjects];
        }
        for (NSDictionary * dic in response.body) {
            QXHMyCardModels *model = [QXHMyCardModels mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
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
        [_tableView registerClass:[QXHMyCardTableViewCell class] forCellReuseIdentifier:@"QXHMyCardTableViewCell"];
        [_tableView registerClass:[QXHMyCardNoPayTableViewCell class] forCellReuseIdentifier:@"QXHMyCardNoPayTableViewCell"];
    }
    return _tableView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 188;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHMyCardModels *model = self.goodsModels[indexPath.row];
    NSLog(@"model.statusmodel.status %@",model.status);
    if ([model.status isEqualToString:@"2"]) {
        QXHMyCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardTableViewCell"];
        [cell.guoQiImage setHidden:YES];
        [cell configUIWithModel:self.goodsModels[indexPath.row]];
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
    }else  if([model.status isEqualToString:@"3"]) {
        QXHMyCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardTableViewCell"];
        [cell.guoQiImage setHidden:NO];
        [cell configUIWithModel:self.goodsModels[indexPath.row]];
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
    }else if([model.status isEqualToString:@"1"]){
        QXHMyCardNoPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardNoPayTableViewCell"];
        [cell configUIWithModel:self.goodsModels[indexPath.row]];
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
    }else{
        QXHMyCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardTableViewCell"];
        [cell.guoQiImage setHidden:NO];
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QXHMyCardModels *model = self.goodsModels[indexPath.row];
    QXHMyCardDetailViewController *vc = [[QXHMyCardDetailViewController alloc]init];
    vc.goodID = model.goodID;
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return TABLEVIEW_NO_HEADER_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}
@end


