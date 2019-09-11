//
//  QXHPersonalViewController.m
//  quxianghui
//
//  Created by mac  on 2019/6/6.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalViewController.h"
#import "QXHPersonalHeaderView.h"
#import "QXHPersonalBannerTableViewCell.h"
#import "QXHPersonalMenuTableViewCell.h"
#import "QXHPersonalToolTableViewCell.h"
#import "QXHAboutUsTableViewCell.h"

//我的收益
#import "QXHProfitHomeViewController.h"
//个人资料
#import "QXHPersonalInfoViewController.h"
//专属客服
#import "QXHPersonalServiceViewController.h"
//用户设置
#import "QXHPersonalSettingViewController.h"
//天天红包
#import "QXHDailyRedEnvelopeViewController.h"
//提现
#import "QXHWithdrawViewController.h"
//我的额度
#import "QXHMyQuotaViewController.h"
//我的团队
#import "QXHMyTeamViewController.h"
//会员页面
#import "QXHFirstVIPCenterViewController.h"
//我的卡券
#import "QXHMyCardHomeViewController.h"
#import "QXHCardHomeViewController.h"
#import "QXHCheckInViewController.h"
//福利任务
#import "QXHFuLiAllViewController.h"
//订单
#import "QXHOrderListAllViewController.h"

//趣享快报
#import "QXHKuaiBaoViewController.h"
//用户指南
#import "QXHUserGuideViewController.h"
//我的收藏
#import "QXHmyCollectionViewController.h"
#import "QXHYaoQingViewController.h"
#import "UmengEnclosed.h"

#import "QXHUserInfoModel.h"
#import "QXHPersonalModel.h"

@interface QXHPersonalViewController ()<UITableViewDelegate,UITableViewDataSource,QXHPersonalMenuCellDelegate,QXHPersonalHeaderDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) QXHPersonalHeaderView *headerView;
@property (nonatomic, strong) QXHUserInfoModel *userModel;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *SettingButton;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign)CGFloat marginTop;
@property(nonatomic, assign)NSInteger imageHeight;
@end

@implementation QXHPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageHeight = 320;
    self.dataArr = @[@"官方公告",@"我的收藏",@"关于我们",@"商务合作"];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
  [self createNaviGational];
    // Do any additional setup after loading the view.
}
-(void)fetchUserInfo{
    [QXHPUTRequest fetchUserInfoWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            
                QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:response.body];
            NSLog(@"initViewWithModel  %@",model.mj_JSONString);
            self.userModel = model;
                [self.headerView initViewWithModel:model];
            [QXHUserDefaults writeUserDefaultObjectValue:response.body withKey:USER_INFO];
            NSLog(@"%@",response.body);
        }
    } failure:^(NSError *error) {
        
    }];
    
    [QXHPUTRequest getMyProfitWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            QXHIncomeModel *model = [QXHIncomeModel mj_objectWithKeyValues:response.body];
            [self.headerView refreshProfirData:model];
        }
    } failure:^(NSError *error) {
        
    }];
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    [self.view addSubview:self.topView];
    
//    self.SettingButton.frame = CGRectMake(SCREEN_WIDTH - 40, height - 44, 44, 44);
    [self.view addSubview:self.SettingButton];
    [self.SettingButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(height - 34);
        make.width.height.equalTo(23);
        make.right.equalTo(-9);
    }];
    [self.view addSubview:self.messageButton];
    [self.messageButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(height - 34);
        make.width.height.equalTo(23);
        make.right.equalTo(self.SettingButton.mas_left).offset(-23);
    }];
    
//    self.SettingButton.frame = CGRectMake(SCREEN_WIDTH - 40, height - 44, 44, 44);
//    [self.view addSubview:self.SettingButton];
    
    [self.view addSubview:self.label];
    [self.label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView.mas_centerX);
        make.centerY.equalTo(self.messageButton.mas_centerY);
    }];
    
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.alpha = 0;
    }
    return _topView;
}
-(UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [[UIButton alloc]init];
        _messageButton.alpha = 0;
        [_messageButton addTarget:self action:@selector(gotoMessage) forControlEvents:UIControlEventTouchUpInside];
        [_messageButton setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    }
    return _messageButton;
}
-(void)gotoMessage{
    QXHPersonalServiceViewController *vc = [QXHPersonalServiceViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)gotoSetting{
    QXHPersonalSettingViewController *vc = [QXHPersonalSettingViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(UIButton *)SettingButton{
    if (!_SettingButton) {
        _SettingButton = [[UIButton alloc]init];
         _SettingButton.alpha = 0;
          [_SettingButton addTarget:self action:@selector(gotoSetting) forControlEvents:UIControlEventTouchUpInside];
        [_SettingButton setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    }
    return _SettingButton;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"个人中心";
        _label.alpha = 0;
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = YES;
    [self fetchUserInfo];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //在其他离开改页面的方法同样加上下面代码
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

-(QXHPersonalHeaderView *)headerView{
    if (!_headerView) {
//        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"QXHPersonalHeaderView" owner:self options:nil] firstObject];
        _headerView = [[QXHPersonalHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 302)];
        _headerView.delegate = self;
    }
    return _headerView;
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-LL_BarHeight)
                      style:UITableViewStyleGrouped];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
                _tableView.tableHeaderView = self.headerView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //隐藏滚动条
        _tableView.showsVerticalScrollIndicator = NO;
        //禁止下拉
        _tableView.alwaysBounceVertical=NO;
        _tableView.bounces=NO;
        
        _tableView.backgroundColor = [UIColor clearColor];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"QXHAboutUsTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHAboutUsTableViewCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:@"QXHPersonalBannerTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHPersonalBannerTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"QXHPersonalMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHPersonalMenuTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"QXHPersonalToolTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"QXHPersonalToolTableViewCell"];
        
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 73.f;
    } else if (indexPath.section == 1) {
        return 160.f;
    } else if (indexPath.section == 2){
        return 134.f;
    }else{
        return 200.f;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        QXHPersonalBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHPersonalBannerTableViewCell"];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1) {
        QXHPersonalMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHPersonalMenuTableViewCell"];
        cell.backgroundColor = [UIColor whiteColor];
        cell.delegate = self;
        return cell;
    } else if (indexPath.section == 2) {
        QXHPersonalToolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHPersonalToolTableViewCell"];
        //        [cell bindGoodsModel:self.goodsModels[indexPath.row-1]];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else{
        QXHAboutUsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHAboutUsTableViewCell"];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        QXHDailyRedEnvelopeViewController *vc = [QXHDailyRedEnvelopeViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - QXHPersonalMenuCellDelegate
- (void)QXHPersonalMenuTableViewCell:(QXHPersonalMenuTableViewCell *)QXHPersonalMenuTableViewCell clickButton:(NSInteger)index{
    switch (index) {
        case 0:
            {
                //我的收益
                QXHProfitHomeViewController *vc = [QXHProfitHomeViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
             break;
        case 1:
        {
            //订单
            QXHOrderListAllViewController *vc = [QXHOrderListAllViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            //我的和团队
            QXHCardHomeViewController *vc = [QXHCardHomeViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            
            //我的团队
            QXHMyTeamViewController *vc = [QXHMyTeamViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            vc.nickName = self.userModel.nickname;
            vc.headURL = self.userModel.avatar;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            //我的签到
            QXHFuLiAllViewController *vc = [QXHFuLiAllViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            //进入   邀请页面  
            QXHYaoQingViewController *vc = [QXHYaoQingViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(void)personalHeaderView:(QXHPersonalHeaderView *)personalHeaderView clickButton:(NSInteger)index{
    switch (index) {
        case 1://个人资料
            
        {
            QXHPersonalInfoViewController *vc = [QXHPersonalInfoViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2://点击会员按钮
            
        {
            
            QXHFirstVIPCenterViewController *vc = [QXHFirstVIPCenterViewController new];
            vc.hidesBottomBarWhenPushed = YES;
           //这三个参数是必须穿  的
            //这个账号的会员等级
            vc.level = self.userModel.level;
            //这个账号的昵称
            vc.nickname = self.userModel.nickname;
             //这个账号头像url
            vc.avatar = self.userModel.avatar;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3://点击消息按钮
        {
            QXHPersonalServiceViewController *vc = [QXHPersonalServiceViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4://点击设置按钮
            
        {
            QXHPersonalSettingViewController *vc = [QXHPersonalSettingViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5://点击复制邀请码
            
        {
            if (self.userModel.invite_code.length > 0) {
                [MBProgressHUD showSuccess:@"复制成功!"];
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = self.userModel.invite_code;
            }
        }
            break;
        case 6://跳转到签到按钮
            
        {
            QXHMyQuotaViewController *vc = [QXHMyQuotaViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7://跳转到签到按钮
            
        {
            QXHCheckInViewController *vc = [QXHCheckInViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8://点击提现按钮
            
        {
            QXHWithdrawViewController *vc = [QXHWithdrawViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 9://点击收益按钮
            
        {
            QXHProfitHomeViewController *vc = [QXHProfitHomeViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
           
        default:
            break;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
//    CGFloat width = self.view.frame.size.width; // 图片宽度
//    CGFloat yOffset = scrollView.contentOffset.y;  // 偏移的y值
//    if (yOffset < 0) {
//        CGFloat totalOffset = _imageHeight + ABS(yOffset);
//        CGFloat f = totalOffset / _imageHeight;
//        self.headerView.frame =  CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset); //拉伸后的图片的frame应该是同比例缩放。
//    }
//
    if (self.marginTop != scrollView.contentInset.top) {
        self.marginTop = scrollView.contentInset.top;
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newoffsetY = offsetY + self.marginTop;
    // 临界值150，向上拖动时变透明
    if (newoffsetY >= 0 && newoffsetY <= 100) {
        self.topView.alpha = offsetY/SCREEN_HEIGHT*5 ;
        self.label.alpha = offsetY/SCREEN_HEIGHT*5;
        self.messageButton.alpha = offsetY/SCREEN_HEIGHT*5;
        self.SettingButton.alpha = offsetY/SCREEN_HEIGHT*5;
        self.label.textColor = [UIColor whiteColor];
    }else if (newoffsetY > 100){
        self.topView.alpha = 1;
        self.label.alpha = 1;
        self.messageButton.alpha = 1;
        self.SettingButton.alpha = 1;
        self.label.textColor = [UIColor whiteColor];
        self.topView.backgroundColor = RGBCOLOR(235, 49, 88);
    }else{
        //         self.topView.alpha = offsetY/SCREEN_HEIGHT;
    }
}
@end
