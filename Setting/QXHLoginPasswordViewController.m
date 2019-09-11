//
//  QXHLoginPasswordViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHLoginPasswordViewController.h"

@interface QXHLoginPasswordViewController ()
{
    NSInteger secondCountDown;
}
@property (weak, nonatomic) IBOutlet UILabel *labelPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRepassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;

@property (nonatomic, strong) NSTimer *countDownTimer;
@end

@implementation QXHLoginPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSave.layer.masksToBounds = YES;
    self.btnSave.layer.cornerRadius = 23.5f;
    self.btnGetCode.layer.masksToBounds = YES;
    self.btnGetCode.layer.cornerRadius = 13.f;
    NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
    
    QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
    self.labelPhoneNumber.text = model.phone;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)getAuthCode:(id)sender {

    NSDictionary *parameters = @{
                                 @"phone":self.labelPhoneNumber.text,
                                 @"send":@(2)
                                 };
    
    [QXHPUTRequest sendMessageWithParameters:parameters success:^(Response *response) {
        if (response.code == 1) {
            
            secondCountDown = [response.body[@"interval"] integerValue] - 1;
            self.btnGetCode.enabled = NO;
            [self.btnGetCode setTitle:[NSString stringWithFormat:@"重新获取%ld",(long)secondCountDown] forState:UIControlStateDisabled];
            _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        }
        
    } failure:^(NSError *error) {
        
    } ];
}
-(void)startTimer{
    [self.btnGetCode setTitle:[NSString stringWithFormat:@"重新获取%ld",(long)--secondCountDown] forState:UIControlStateDisabled];
    if (secondCountDown == -1) {
        [_countDownTimer invalidate];
        [self.btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.btnGetCode.enabled = YES;
    }
}
- (IBAction)saveAction:(id)sender {
    if (self.txtCode.text.length == 0) {
        [MBProgressHUD showError:@"请输入验证码"];
        return;
    }
    if (![self.txtPassword.text isEqualToString:self.txtRepassword.text]) {
        [MBProgressHUD showError:@"两次输入的密码不一致"];
        return;
    }
    if (self.txtPassword.text.length < 6 || self.txtPassword.text.length > 24) {
        [MBProgressHUD showError:@"请输入6-24位密码"];
        return;
    }
    NSDictionary *parameters = @{
                                 @"phone":self.labelPhoneNumber.text,
                                 @"password":self.txtPassword.text,
                                 @"confirm_password":self.txtPassword.text,
                                 @"code":self.txtCode.text
                                 };
    
    [QXHPUTRequest resetPasswordWithParameters:parameters success:^(Response *response) {
        if (response.code == 1) {
            [MBProgressHUD showSuccess:response.msg toView:self.view];
            [self backAction:nil];
        }else{
            [MBProgressHUD showError:response.msg toView:self.view];
        }
    } failure:^(NSError *error) {
        
    } ];
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
