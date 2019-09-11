//
//  QXHDongJieShouRuViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHDongJieShouRuViewController.h"
#import "QXHCheckJiLuTableViewCell.h"
#import "BtnClickForAlertView.h"
#import "QXHDongJieView.h"
#import "QXHDongJieModel.h"

@interface QXHDongJieShouRuViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@end

@implementation QXHDongJieShouRuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    [self createNaviGational];
    [self requestData];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
-(void)createNaviGational{
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor qmui_colorWithHexString:@"FFFFFF"];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, topView.frame.size.height - 30, 100, 20);
    label.text = @"冻结收入";
    [topView addSubview:label];
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btnBack);
        make.centerX.equalTo(topView);
    }];
    
    [self.view addSubview:topView];
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)requestData{
    //我的团队数量 上方的
    [PPHTTPRequest dongJieShouRuWihtParameters:nil success:^(Response *response) {
        NSLog(@"responseresponse  %@",[response mj_JSONString]);
        for (NSDictionary * dic in response.body) {
            QXHDongJieModel *model = [QXHDongJieModel mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
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
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHCheckJiLuTableViewCell class] forCellReuseIdentifier:@"QXHCheckJiLuTableViewCell"];
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        QXHCheckJiLuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHCheckJiLuTableViewCell"];
    [cell configNewUIWithModel:self.goodsModels[indexPath.row]];
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHDongJieView *alert = [[QXHDongJieView alloc] initCreateTanChuanView];
    [self.view addSubview:alert];
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view createWithTp:-100];
    [self.view addSubview:view];
    return view;
}
@end

