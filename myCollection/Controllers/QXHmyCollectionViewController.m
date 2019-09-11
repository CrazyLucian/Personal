//
//  QXHmyCollectionViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/26.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHmyCollectionViewController.h"
#import "QXHHomeGoodsDetailViewController.h"
#import "QXHMyCollectionCell.h"
@interface QXHmyCollectionViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation QXHmyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
     [self createNaviGational];
     [self.view addSubview:self.tableView];
    [QXHPUTRequest getMyCollectionWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            NSArray *list = response.body[@"list"];
            for (int i = 0; i < list.count; i++){
                NSDictionary *data = list[i];
                QXHGoodDetailModel *model = [QXHGoodDetailModel mj_objectWithKeyValues:data[@"data"]];
                [self.dataArray addObject:model];
                [self.tableView reloadData];
            }
        }
    } failure:^(NSError *error) {
        
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    [topView az_setGradientBackgroundWithColors:@[RGBCOLOR(234, 69, 46 ),RGBCOLOR(234, 65, 72)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = @"我的收藏";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    [self.view addSubview:topView];
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableView*)tableView {
    if (!_tableView) {
        CGFloat height = 64;
        if (kDevice_Is_iPhoneX) {
            height = 88;
        }
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, height, SCREEN_WIDTH, SCREEN_HEIGHT-64)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHMyCollectionCell class] forCellReuseIdentifier:@"QXHMyCollectionCell"];
        
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHMyCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCollectionCell"];
    [cell bindGoodsModel:self.dataArray[indexPath.row]];
    return cell;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHHomeGoodsModel *model = self.dataArray[indexPath.row];
    QXHHomeGoodsDetailViewController *vc = [[QXHHomeGoodsDetailViewController alloc] initWithBarStyle:QDNavigationBarStyleLight];
    vc.customNavBarTransition = YES;
    vc.itemid = model.itemid;
    vc.yongjinModel = model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  处理按钮的点击事件
 */
//- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
//    UISearchBar *searchBar = self.searchDisplayController.searchBar;
//    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.com/apps/%@", searchBar.text]];
//    
//    if ([[UIApplication sharedApplication] canOpenURL:URL]) {
//        [[UIApplication sharedApplication] openURL:URL];
//    }
//}
@end
