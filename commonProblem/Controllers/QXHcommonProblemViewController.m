//
//  QXHcommonProblemViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHcommonProblemViewController.h"
#import "QXHCommonPrblemTableViewCell.h"
#import "QXHCommonProblemModels.h"
#import "QXHCommonNextViewController.h"

@interface QXHcommonProblemViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *nameArray;
@property(nonatomic,strong)NSArray *imageArray;
@property (nonatomic, strong) NSMutableArray *goodsModels;
@property (nonatomic, strong) NSMutableArray *goodsArrayModels;
@property (nonatomic, strong) QXHProblemArrayModels *proModels;
@end

@implementation QXHcommonProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    self.goodsArrayModels = [[NSMutableArray alloc]init];
    
    self.proModels = [[QXHProblemArrayModels alloc]init];
    [self createNaviGational];
    [self requsetHttp];
    self.nameArray = [[NSArray alloc]init];
    self.imageArray = [[NSArray alloc]init];
    self.nameArray =@[@"关于订单",@"关于收益",@"关于优惠",@"关于分享",@"其他问题"];
     self.imageArray =@[@"订单(1)",@"钱袋(1)",@"优惠券",@"分享(1)",@"其他"];
     [self.view addSubview:self.tableView];
}
-(void)requsetHttp{
    [PPHTTPRequest changJianWenTIWihtParameters:nil success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        self.goodsModels = response.body;
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
        [_tableView registerClass:[QXHCommonPrblemTableViewCell class] forCellReuseIdentifier:@"QXHCommonPrblemTableViewCell"];
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsModels.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHCommonPrblemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHCommonPrblemTableViewCell"];
    cell.iconHeadImage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.nameLable.text = self.nameArray[indexPath.row];
    [cell congigUIWithArray:self.goodsModels[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXHCommonNextViewController *vc = [[QXHCommonNextViewController alloc]init];
    if (![self.goodsModels[indexPath.row] isKindOfClass:[NSNull class]]) {
        QXHProblemArrayModels *model = [QXHProblemArrayModels mj_objectWithKeyValues:self.goodsModels[indexPath.row][0]];
        vc.type = model.type;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
