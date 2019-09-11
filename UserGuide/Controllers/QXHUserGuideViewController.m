//
//  QXHUserGuideViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHUserGuideViewController.h"
#import "QXHUserGuideTableViewCell.h"
#import "QXHcommonProblemViewController.h"
#import "QXHUserGuideDetailViewController.h"
@interface QXHUserGuideViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation QXHUserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNaviGational];
    [self.view addSubview:self.tableView];
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"用户使用指南";
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
        
//        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHUserGuideTableViewCell class] forCellReuseIdentifier:@"QXHUserGuideTableViewCell"];
        
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 2;
            break;
        case 5:
            return 1;
            break;
        case 6:
            return 1;
            break;
        case 7:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHUserGuideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHUserGuideTableViewCell"];
    if (indexPath.section == 0){
            cell.iconHeadImage.image = [UIImage imageNamed:@"yonghuzhuce"];
        if (indexPath.row == 0) {
            cell.nameLable.text = @"用户注册指南①";
        }else{
            cell.nameLable.text = @"用户注册指南②";
        }
    }else if(indexPath.section == 1){
        cell.iconHeadImage.image = [UIImage imageNamed:@"huafei"];
         cell.nameLable.text = @"话费充值指南";
    }else if(indexPath.section == 2){
        cell.iconHeadImage.image = [UIImage imageNamed:@"huiyuan"];
        cell.nameLable.text = @"试听会员指南";
    }else if(indexPath.section == 3){
        cell.iconHeadImage.image = [UIImage imageNamed:@"qiaquan"];
        cell.nameLable.text = @"生活卡券指南";
    }else if(indexPath.section == 4){
        cell.iconHeadImage.image = [UIImage imageNamed:@"youhuiquan"];
        if (indexPath.row == 0) {
            cell.nameLable.text = @"淘宝领券指南①";
        }else{
            cell.nameLable.text = @"淘宝领券指南②";
        }
    }else if(indexPath.section == 5){
        cell.iconHeadImage.image = [UIImage imageNamed:@"renwu"];
        cell.nameLable.text = @"网赚任务指南";
    }else if(indexPath.section == 6){
        cell.iconHeadImage.image = [UIImage imageNamed:@"licaishouyi"];
        cell.nameLable.text = @"收益查看及提现指南";
    }else if(indexPath.section == 7){
        cell.iconHeadImage.image = [UIImage imageNamed:@"yaoqinghaoyou"];
        cell.nameLable.text = @"邀请好友指南";
    }
    cell.backgroundColor  = [UIColor clearColor];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lable = [[UILabel alloc]init];
    if (section == 0){
         lable.text = @"用户注册";
    }else if (section == 1){
       lable.text = @"话费充值";
    }else if (section == 2){
        lable.text = @"视听会员";
    }else if (section == 3){
        lable.text = @"生活卡券";
    }else if (section == 4){
        lable.text = @"淘宝领券";
    }else if (section == 5){
        lable.text = @"网赚任务";
    }else if (section == 6){
        lable.text = @"收益查看及提现";
    }else if (section == 7){
        lable.text = @"邀请好友";
    }
    
    [view addSubview:lable];
    [lable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view.mas_centerY);
        make.left.equalTo(15);
    }];
    return view;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 5;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//        QXHcommonProblemViewController *vc = [[QXHcommonProblemViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    QXHUserGuideDetailViewController *vc = [[QXHUserGuideDetailViewController alloc]init];
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
             vc.imageName = @"bg_g_register1.jpg";
        }else{
             vc.imageName = @"bg_g_register2.jpg";
        }
    }else if(indexPath.section == 1){
         vc.imageName = @"bg_g_phone_recharge.jpg";
    }else if(indexPath.section == 2){
         vc.imageName = @"bg_g_mv_vip.jpg";
    }else if(indexPath.section == 3){
         vc.imageName = @"bg_g_life_card.jpg";
    }else if(indexPath.section == 4){
        if (indexPath.row == 0) {
             vc.imageName = @"bg_g_tb_card1.png";
        }else{
             vc.imageName = @"bg_g_tb_card2.png";
        }
    }else if(indexPath.section == 5){
         vc.imageName = @"bg_g_task.jpg";
    }else if(indexPath.section == 6){
         vc.imageName = @"bg_g_income.jpg";
    }else if(indexPath.section == 7){
         vc.imageName = @"bg_g_share_friend.jpg";
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
