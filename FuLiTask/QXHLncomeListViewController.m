//
//  QXHLncomeListViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHLncomeListViewController.h"
#import "QXHInComeHeadCell.h"
#import "QXHMyTaskDetailCell.h"
#import "QXHMyTaskMoneyTableViewCell.h"
#import "QXHBaoBiaoModel.h"

@interface QXHLncomeListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSDictionary *teamDictionary;
@property (nonatomic, strong) NSDictionary *selfDictionary;
@property (nonatomic, strong) NSString *zhuanMoney;
@end

@implementation QXHLncomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.teamDictionary = [[NSDictionary alloc]init];
    self.selfDictionary =  [[NSDictionary alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
     self.navigationController.navigationBarHidden = YES;
    // 初始化导航栏
    [self requestData];
    [self createNaviGational];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark - 初始化导航栏
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor qmui_colorWithHexString:@"FFFFFF"];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"收入报表";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    
    [self.view addSubview:topView];
}
- (void)requestData{
    //我的团队数量 上方的
    [PPHTTPRequest shouRuBaoBiaoWithParameters:@{@"type":@1} success:^(Response *response) {
        NSLog(@"responseresponse  %@",[response mj_JSONString]);
            QXHBaoBiaoModel *model = [QXHBaoBiaoModel mj_objectWithKeyValues:response.body];
        NSLog(@"model.teammodel.team  %@",model.team);
        self.teamDictionary = model.team;
        self.selfDictionary = model.OnTeam;
        self.zhuanMoney = model.total;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)backAction:(UIButton *)button{
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
        [_tableView registerClass:[QXHInComeHeadCell class] forCellReuseIdentifier:@"QXHInComeHeadCell"];
         [_tableView registerClass:[QXHMyTaskMoneyTableViewCell class] forCellReuseIdentifier:@"QXHMyTaskMoneyTableViewCell"];
         [_tableView registerClass:[QXHMyTaskDetailCell class] forCellReuseIdentifier:@"QXHMyTaskDetailCell"];
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
         return 160;
    }else{
        if (indexPath.row == 0) {
         return   124;
        }else{
            return 300;
        }
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        QXHInComeHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHInComeHeadCell"];
        cell.zhuanLable.text = self.zhuanMoney;
        cell.backgroundColor =RGBCOLOR(250, 250, 250);
        return cell;
    }else{
        if (indexPath.row == 0) {
            QXHMyTaskMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyTaskMoneyTableViewCell"];
            if (indexPath.section == 1) {
                [cell bindGoodsModel:self.selfDictionary];
                cell.nameLable.text = @"我的任务收益";
            }else{
                 [cell bindGoodsModel:self.teamDictionary];
                cell.nameLable.text = @"团队任务收益";
            }
            cell.backgroundColor =RGBCOLOR(250, 250, 250);
            return cell;
        }else{
            QXHMyTaskDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyTaskDetailCell"];
            if (indexPath.section == 1) {
                [cell bindGoodsModel:self.selfDictionary];
            }else{
                [cell bindGoodsModel:self.teamDictionary];
            }
            cell.backgroundColor =RGBCOLOR(250, 250, 250);
            return cell;
        }
    }
}
@end
