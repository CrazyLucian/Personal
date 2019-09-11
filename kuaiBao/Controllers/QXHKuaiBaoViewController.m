//
//  QXHKuaiBaoViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHKuaiBaoViewController.h"
#import "QXHKuaiBaoTableViewCell.h"
#import "QXHKuaiBaoContrentVC.h"
#import "QXHKuaiBaoModels.h"
@interface QXHKuaiBaoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@end

@implementation QXHKuaiBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    [self requsetHttp];
    self.view.backgroundColor = RGBCOLOR(248, 248, 248);
    [self createNaviGational];
     [self.view addSubview:self.tableView];
}
-(void)requsetHttp{
    [PPHTTPRequest quXiangKuaiBaoWihtParameters:nil success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        for (NSDictionary * dic in response.body) {
            QXHKuaiBaoModels *model = [QXHKuaiBaoModels mj_objectWithKeyValues:dic];
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
    topView.backgroundColor = [UIColor clearColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"趣享快报";
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
        [_tableView registerClass:[QXHKuaiBaoTableViewCell class] forCellReuseIdentifier:@"QXHKuaiBaoTableViewCell"];

    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 118;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHKuaiBaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHKuaiBaoTableViewCell"];
    cell.backgroundColor  = [UIColor clearColor];
    [cell bindGoodsModel:self.goodsModels[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHKuaiBaoModels *model = self.goodsModels[indexPath.row];
    QXHKuaiBaoContrentVC *vc = [[QXHKuaiBaoContrentVC alloc] init];
    vc.typeID = model.typeID;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
