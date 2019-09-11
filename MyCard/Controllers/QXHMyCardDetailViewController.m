//
//  QXHMyCardDetailViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardDetailViewController.h"
#import "QXHMyCardDetailHeadCell.h"
#import "QXHMyCardNumberCell.h"
#import "QXHMyCardMingXiCell.h"
#import "QXHmyCardDetailModel.h"
@interface QXHMyCardDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) QXHmyCardDetailModel *barandModel;
@end

@implementation QXHMyCardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barandModel = [[QXHmyCardDetailModel alloc]init];
    self.navigationController.navigationBarHidden = YES;
    [self createNavigation];
    [self requestHttp];
     [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}
-(void)requestHttp{
    [PPHTTPRequest myCardDetailWihtParameters:@{@"id":self.goodID} success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        QXHmyCardDetailModel *barand = [QXHmyCardDetailModel mj_objectWithKeyValues:response.body];
        self.barandModel = barand;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)createNavigation{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor  whiteColor];
    [self.view addSubview:view];
    
    UIButton * leftBackButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 32, 10, 16)];
    [leftBackButton setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [leftBackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftBackButton];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(151, 31, 150, 17)];
    lable.text =@"卡券详情";
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
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //品牌分类上方的几个按钮
        [_tableView registerClass:[QXHMyCardDetailHeadCell class] forCellReuseIdentifier:@"QXHMyCardDetailHeadCell"];
         [_tableView registerClass:[QXHMyCardNumberCell class] forCellReuseIdentifier:@"QXHMyCardNumberCell"];
        [_tableView registerClass:[QXHMyCardMingXiCell class] forCellReuseIdentifier:@"QXHMyCardMingXiCell"];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        return 235;
    }else if (indexPath.row  == 1 || indexPath.row == 2){
        return 86;
    }else{
        return 86;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        QXHMyCardDetailHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardDetailHeadCell"];
        [cell configUIWithModel:self.barandModel];
          return cell;
    }else if (indexPath.row == 1  || indexPath.row == 2){
        QXHMyCardNumberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardNumberCell"];
        if (indexPath.row == 1){
            cell.cardName.text = @"卡号";
            cell.cardNumber.text = self.barandModel.card_number;
        }else{
            cell.cardName.text = @"密码";
             cell.cardNumber.text = self.barandModel.card_pwd;
        }

          return cell;
    }else{
        QXHMyCardMingXiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyCardMingXiCell"];
        [cell configUIWithModel:self.barandModel.rule];
        return cell;
    }
}
@end
