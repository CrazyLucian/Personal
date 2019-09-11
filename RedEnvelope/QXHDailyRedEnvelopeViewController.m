//
//  QXHDailyRedEnvelopeViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHDailyRedEnvelopeViewController.h"
#import "QXHJoinActivityViewController.h"
#import "QXHRedEnvelopeRecordViewController.h"
#import "QXHRewardWithdrawViewController.h"
#import "QXHYaoQingViewController.h"
#import "QXHPersonalModel.h"
@interface QXHDailyRedEnvelopeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnWithdraw;
@property (weak, nonatomic) IBOutlet UILabel *labelAllIncome;
@property (weak, nonatomic) IBOutlet UILabel *labelTomorrowIncome;
@property (weak, nonatomic) IBOutlet UIButton *btnJoin;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@property (nonatomic, strong) QXHPacketModel *packetModel;
@end

@implementation QXHDailyRedEnvelopeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.baseScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.bgView.layer.cornerRadius = 16;
    self.btnJoin.layer.cornerRadius = 10.f;
    self.btnJoin.layer.masksToBounds = YES;
    self.btnWithdraw.layer.cornerRadius = 10.f;
    self.btnWithdraw.layer.masksToBounds = YES;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getRedEnveloper];
}
-(void)getRedEnveloper{
    [QXHPUTRequest getRedEnvelopeInfoWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            self.packetModel = [QXHPacketModel mj_objectWithKeyValues:response.body];
            self.labelAllIncome.text = self.packetModel.red_packet;
            CGFloat floatValue = [self.packetModel.red_packet_surplus floatValue] * ([self.packetModel.profit_ratio floatValue] / 100) / [self.packetModel.year integerValue];
            if (floatValue < 0.01 && floatValue != 0) {
                floatValue = 0.01;
            }
            self.labelTomorrowIncome.text = [NSString stringWithFormat:@"%.2f",floatValue];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)checkRecord:(id)sender {
    QXHRedEnvelopeRecordViewController *vc = [QXHRedEnvelopeRecordViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)joinActivity:(id)sender {
    QXHJoinActivityViewController *vc = [QXHJoinActivityViewController new];
    vc.model = self.packetModel;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)withdrawAction:(id)sender {
    QXHRewardWithdrawViewController *vc = [QXHRewardWithdrawViewController new];
    vc.model = self.packetModel;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)inviteFriend:(id)sender {
    //进入   邀请页面
    QXHYaoQingViewController *vc = [QXHYaoQingViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
