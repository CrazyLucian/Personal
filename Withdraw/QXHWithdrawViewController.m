//
//  QXHWithdrawViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHWithdrawViewController.h"
#import "QXHWithdrawRecordViewController.h"
#import "QXHWithdrawSuccessView.h"
#import "QXHCustomAlertView.h"
#import "QXHPersonalModel.h"
@interface QXHWithdrawViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelRate;
@property (weak, nonatomic) IBOutlet UITextField *txtMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnWithdraw;

@property (nonatomic, assign) NSInteger balance;
@end

@implementation QXHWithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnWithdraw.layer.masksToBounds = YES;
    self.btnWithdraw.layer.cornerRadius = 4.f;
    self.txtMoney.placeholder = @"请输入提现金额";
    [self.txtMoney setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    
    NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
    QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
    self.balance = [model.balance integerValue];
    self.labelAmount.text = [NSString stringWithFormat:@"账户余额%@元",model.balance];
    
    [self getPoundage];
    // Do any additional setup after loading the view from its nib.
}
-(void)getPoundage{
    [QXHPUTRequest getWithdrawPoundageWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            self.labelRate.text = [NSString stringWithFormat:@"收取%@%%手续费",response.body[@"poundage"]];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)checkWithdrawRecord:(id)sender {
    QXHWithdrawRecordViewController *vc = [QXHWithdrawRecordViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)checkExplain:(id)sender {
    NSDictionary *appConfig = [QXHUserDefaults readUserDefaultObjectValueForKey:APP_CONFIG];
    QXHConfigModel *model = [QXHConfigModel mj_objectWithKeyValues:appConfig];
    QXHCustomAlertView *alertView = [[QXHCustomAlertView alloc] initCreateTanChuanViewWithTitle:@"津贴提现说明" subTitle:@"联合创始人 管理津贴" content:model.withdraw_explain];
    [self.view addSubview:alertView];
}
- (IBAction)allWithdraw:(id)sender {
    if (self.balance == 0) {
        [MBProgressHUD showError:@"可提现余额为0"];
        return;
    }
    NSDictionary *parameter = @{@"money":@(self.balance),
                                @"type":@"ordinary"
                                };
    [QXHPUTRequest withdrawWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            QXHWithdrawSuccessView *view = [[QXHWithdrawSuccessView alloc] initView];
            [self.view addSubview:view];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (IBAction)withdrawAction:(id)sender {
    if (self.txtMoney.text.length == 0) {
        [MBProgressHUD showError:@"请输入提现金额"];
        return;
    }
    if ([self.txtMoney.text integerValue] > self.balance) {
        [MBProgressHUD showError:@"余额不足"];
        return;
    }
    NSDictionary *parameter = @{@"amount":self.txtMoney.text,
                                @"type":@"ordinary"
                                };
    [QXHPUTRequest withdrawWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            QXHWithdrawSuccessView *view = [[QXHWithdrawSuccessView alloc] initView];
            [self.view addSubview:view];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length == 0) {
        textField.placeholder = @"请输入提现金额";
        [textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length == 0) {
        textField.placeholder = @"请输入提现金额";
        [textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    }
    return YES;
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
