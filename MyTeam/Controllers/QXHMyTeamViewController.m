//
//  QXHMyTeamViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamViewController.h"
#import "QXHMyTeamCell.h"
#import "QXHMyTeamHeadView.h"
#import "QXHMyTeamNumberModels.h"
//#import "qxh"

//我的团队页面
@interface QXHMyTeamViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) QXHMyTeamHeadView *headerView;
@property (nonatomic, strong) QXHMyTeamNumberModels *barandModel;
@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign)CGFloat marginTop;
@property (nonatomic, strong) UIButton *btnBack;
@end

@implementation QXHMyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barandModel = [[QXHMyTeamNumberModels  alloc] init];
    self.listArray = [[NSMutableArray alloc]init];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor =RGBCOLOR(249, 249, 249);
    [self requestData];
    [self requsetListArray];
    [self.view addSubview:self.tableView];
//    [self.leftBackButton makeConstraints:^(MASConstraintMaker *make) {
//            make.width.height.equalTo(30);
//            make.left.equalTo(12);
//            make.top.equalTo(30);
//    }];
    [self createNaviGational];
    // Do any additional setup after loading the view.
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    [self.view addSubview:self.topView];
    
    self.btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [self.view addSubview:self.btnBack];
    
    [self.view addSubview:self.label];
    [self.label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView.mas_centerX);
        make.centerY.equalTo(self.topView.mas_centerY).offset(5);
    }];
    
}
-(void)onTap{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        [_topView az_setGradientBackgroundWithColors:@[RGBCOLOR(233, 127, 33 ),RGBCOLOR(245, 61, 77)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
        _topView.alpha = 0;
    }
    return _topView;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"我的团队";
        _label.alpha = 0;
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}
-(UIButton *)btnBack{
    if (!_btnBack) {
        _btnBack = [[UIButton alloc]init];
        _btnBack.alpha = 0;
        [_btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_btnBack addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnBack;
}
-(QXHMyTeamHeadView *)headerView{
    if (!_headerView) {
        _headerView = [[QXHMyTeamHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 460)];
    }
    return _headerView;
}
- (void)requestData{
    //我的团队数量 上方的
    [PPHTTPRequest myTeamNumberWithParameters:nil success:^(Response *response) {
        NSLog(@"%@",response.msg);

        QXHMyTeamNumberModels *barand = [QXHMyTeamNumberModels mj_objectWithKeyValues:response.body];
        NSLog(@"vip_num ====  %@",barand.mj_JSONString);
         self.barandModel = barand;
        [self.headerView configUIWithModel:self.barandModel];
        self.headerView.NameLable.text = self.nickName;
        [self.headerView.headImageView sd_setImageWithURL:[NSURL URLWithString:self.headURL] placeholderImage:PLACEHOLDERIMAGE];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)requsetListArray{
    //    //我的团队列表
        [PPHTTPRequest myTeamLieBiaoWithParameters:nil success:^(Response *response) {
            NSLog(@"%@",[response mj_JSONString]);
            for (NSDictionary * dic in response.body) {
                QXHMyTeamNumberContentModels *model = [QXHMyTeamNumberContentModels mj_objectWithKeyValues:dic];
                [self.listArray addObject:model];
            }
            [self.tableView reloadData];
        } failure:^(NSError *error) {
    
        }];
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
         _tableView.tableHeaderView = self.headerView;
        _tableView.bounces = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHMyTeamCell class] forCellReuseIdentifier:@"QXHMyTeamCell"];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        QXHMyTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyTeamCell"];
    [cell configUIWithModel: self.listArray[indexPath.row]];
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    QXHEmptyView *view = [[QXHEmptyView alloc]init];
    [view createWithTp:230];
    [self.view addSubview:view];
    return view;
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (self.marginTop != scrollView.contentInset.top) {
        self.marginTop = scrollView.contentInset.top;
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newoffsetY = offsetY + self.marginTop;
    // 临界值150，向上拖动时变透明
    if (newoffsetY >= 0 && newoffsetY <= 100) {
        self.topView.alpha = offsetY/SCREEN_HEIGHT*5 ;
        self.label.alpha = offsetY/SCREEN_HEIGHT*5;
        self.btnBack.alpha = offsetY/SCREEN_HEIGHT*5;
        self.label.textColor = [UIColor whiteColor];
    }else if (newoffsetY > 100){
        self.topView.alpha = 1;
        self.label.alpha = 1;
         self.btnBack.alpha = 1;
        self.label.textColor = [UIColor whiteColor];
//        self.topView.backgroundColor = RGBCOLOR(235, 49, 88);
    }else{
        //         self.topView.alpha = offsetY/SCREEN_HEIGHT;
    }
}
@end
