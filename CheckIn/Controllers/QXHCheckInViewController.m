//
//  QXHCheckInViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCheckInViewController.h"
#import "LTSCalendarContentView.h"
#import "LTSCalendarWeekDayView.h"
#import "LTSCalendarManager.h"
#import "QXHCheckJiLuViewController.h"
#import "BtnClickForAlertView.h"
#import "QXHCheckInModel.h"

@interface QXHCheckInViewController ()<LTSCalendarEventSource>
@property (nonatomic,strong)LTSCalendarContentView *calendarView;
@property (nonatomic,strong)LTSCalendarManager *manager;
@property (nonatomic,strong)UILabel *moneyLable;
@property (nonatomic, strong) QXHCheckNewModel *chickModel;
@property (nonatomic, strong) UIButton *checkButton;
//@property (nonatomic,strong)UIView *redView;

@end

@implementation QXHCheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chickModel = [[QXHCheckNewModel alloc]init];
    self.navigationController.navigationBarHidden = YES;
    [self requestChickIn];
//    [self createNaviGational];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)requestChickIn{
    [PPHTTPRequest checkInWithParameters:nil success:^(Response *response) {
    QXHCheckNewModel *model = [QXHCheckNewModel mj_objectWithKeyValues:response.body];
    self.chickModel = model;
        [self createNaviGational];
    } failure:^(NSError *error) {
    }];
}
-(void)createNaviGational{
    
    UIView *redView = [[UIView alloc]init];
    [redView az_setGradientBackgroundWithColors:@[RGBCOLOR(245, 61, 77),RGBCOLOR( 233, 127, 33)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1,0)];
    [self.view addSubview:redView];
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(0);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(181);
    }];
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor clearColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = @"每日签到";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    
    UIButton *jiLuButton = [[UIButton alloc] init];
    [jiLuButton setTitle:@"签到记录" forState:UIControlStateNormal];
    [jiLuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    jiLuButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [jiLuButton addTarget:self action:@selector(goToJliView:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:jiLuButton];
    [jiLuButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(54);
        make.height.equalTo(12);
        make.right.equalTo(-15);
        make.centerY.equalTo(label.mas_centerY);
    }];
    [self.view addSubview:topView];
   //日历控件
    self.manager = [LTSCalendarManager new];
    self.manager.eventSource = self;
    self.manager.weekDayView = [[LTSCalendarWeekDayView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    [self.view addSubview:self.manager.weekDayView];
    self.manager.calenderScrollView = [[LTSCalendarScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.manager.weekDayView.frame), CGRectGetWidth(self.view.frame), 50)];
    [self.manager  showSingleWeek];
    [self.view addSubview:self.manager.calenderScrollView];
    self.automaticallyAdjustsScrollViewInsets = false;
    //下方带齿轮的view
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chiView"]];
    [backView setUserInteractionEnabled:YES];
    [self.view addSubview:backView];
    
    [backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.right.equalTo(-12);
        make.height.equalTo(108);
        make.top.equalTo(redView.mas_bottom).offset(-3);
    }];
    
    
    UIImageView *qiaoBao = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qianbao"]];
    [backView addSubview:qiaoBao];
    [qiaoBao makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(25);
        make.top.equalTo(29);
        make.width.equalTo(42);
        make.height.equalTo(35);
    }];
    UILabel *leiJiLable = [[UILabel alloc]init];
    leiJiLable.text = @"累计签到奖励";
    leiJiLable.font = [UIFont systemFontOfSize:12];
    leiJiLable.textColor = RGBCOLOR(102, 102, 102);
    [backView addSubview:leiJiLable];
    [leiJiLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(qiaoBao.mas_top);
        make.left.equalTo(qiaoBao.mas_right).offset(12);
    }];
    
    [backView addSubview:_moneyLable];
    self.moneyLable.text = [NSString stringWithFormat:@"¥ %@",self.chickModel.total];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leiJiLable.mas_bottom).offset(6);
        make.left.equalTo(qiaoBao.mas_right).offset(12);
    }];
    
    
    _checkButton = [[UIButton alloc]init];
    if (self.chickModel.is_sign_in){
        //已经签到了
        _checkButton.backgroundColor = RGBCOLOR(51, 51, 51);
        [_checkButton setEnabled:NO];
    }else{
        _checkButton.backgroundColor = RGBCOLOR(233, 46, 21);
        [_checkButton setEnabled:YES];
    }
    [_checkButton setTitle:@"立即签到" forState:UIControlStateNormal];
//    checkButton.backgroundColor = RGBCOLOR(233, 46, 21);
    _checkButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _checkButton.layer.cornerRadius = 5;
    _checkButton.layer.masksToBounds = YES;
    [_checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_checkButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:_checkButton];
    [_checkButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(82);
        make.height.equalTo(30);
        make.right.equalTo(-25);
        make.centerY.equalTo(qiaoBao.mas_centerY);
    }];
    
    UIImageView *bigImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"小额投入 领巨额红包"]];
    [self.view addSubview:bigImageView];
    [bigImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(backView.mas_bottom).offset(21);
        make.height.equalTo(107);
    }];
    
    UIImageView *logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"图层logo"]];
    [self.view addSubview:logoImageView];
    [logoImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(bigImageView.mas_bottom).offset(35);
        make.height.equalTo(24);
        make.width.equalTo(72);
    }];
    
    UILabel *logoNameView = [[UILabel alloc]init];
    logoNameView.text = @"逸趣缤纷 惠享生活";
    logoNameView.font = [UIFont systemFontOfSize:12];
    logoNameView.textColor = RGBCOLOR(223, 223, 223);
    [self.view addSubview:logoNameView];
    [logoNameView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(logoImageView.mas_bottom).offset(12);
        make.height.equalTo(12);
        make.width.equalTo(110);
    }];
}
-(void)backAction:(UIButton *)button{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)goToJliView:(UIButton *)button{
    QXHCheckJiLuViewController *vc = [[QXHCheckJiLuViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btnClick{
    [PPHTTPRequest checkInNewWithParameters:nil success:^(Response *response) {
//          [self requestChickIn];
        BtnClickForAlertView *alert = [[BtnClickForAlertView alloc] initCreateTanChuanView];
        alert.firstLable.text = response.body[@"sign_in"];
        _checkButton.backgroundColor = RGBCOLOR(51, 51, 51);
        [_checkButton setEnabled:NO];
        [self.view addSubview:alert];
//        [self requestChickIn];
      
    } failure:^(NSError *error) {
    }];
    
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBackView{
    QXHCheckJiLuViewController *vc = [[QXHCheckJiLuViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.textColor = RGBCOLOR(102, 102, 102);
        _moneyLable.font = AppFont(15);
        _moneyLable.text = @"¥ 12.30";
        [self.view addSubview:_moneyLable];
    }
    return _moneyLable;
}
//- (void)BtnClick:(UIButton *)btn{
//    NSLog(@"点击");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
