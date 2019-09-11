//
//  QXHCommonNextViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCommonNextViewController.h"
#import "QXHCommonNextCell.h"
#import "QXHCommonContentViewController.h"
#import "QXHCommonProblemModels.h"

@interface QXHCommonNextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@property (nonatomic, strong) QXHProblemArrayModels *moarraModels;
@end

@implementation QXHCommonNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    QXHProblemArrayModels *moarraModels = [[QXHProblemArrayModels alloc]init];
    [self requsetHttp];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNaviGational];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
-(void)requsetHttp{
    [PPHTTPRequest changJianWenTIWihtParameters:@{@"type":self.type} success:^(Response *response) {
        for (NSDictionary * dic in response.body) {
            QXHProblemArrayModels *model = [QXHProblemArrayModels mj_objectWithKeyValues:dic];
            [self.goodsModels addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
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
    label.text = @"常见问题";
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
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)
                      style:UITableViewStylePlain];

        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHCommonNextCell class] forCellReuseIdentifier:@"QXHCommonNextCell"];

    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHCommonNextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHCommonNextCell"];
    [cell bindGoodsModel:self.goodsModels[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHCommonContentViewController *vc = [[QXHCommonContentViewController alloc]init];
    self.moarraModels = self.goodsModels[indexPath.row];
    vc.typeID = self.moarraModels.typeID;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
