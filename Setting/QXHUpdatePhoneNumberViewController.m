//
//  QXHUpdatePhoneNumberViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHUpdatePhoneNumberViewController.h"
#import "QXHIdentitySuccessViewController.h"
@interface QXHUpdatePhoneNumberViewController (){
    NSInteger secondCountDown;
}
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (nonatomic, strong) NSTimer *countDownTimer;
@end

@implementation QXHUpdatePhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSubmit.layer.masksToBounds = YES;
    self.btnSubmit.layer.cornerRadius = 23.5f;
    self.btnGetCode.layer.masksToBounds = YES;
    self.btnGetCode.layer.cornerRadius = 13.f;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)submitAndBinding:(id)sender {
    
    if (self.txtPhoneNumber.text.length == 0) {
        [MBProgressHUD showError:@"请输入手机号码"];
        return;
    }
    if (self.txtCode.text.length == 0) {
        [MBProgressHUD showError:@"请输入验证码"];
        return;
    }
    
    NSDictionary *parameters = @{
                                 @"phone":self.txtPhoneNumber.text,
                                 @"code":self.txtCode.text
                                 };
    
    [QXHPUTRequest updatePhoneNumberWithParameters:parameters success:^(Response *response) {
        if (response.code == 1) {
            QXHIdentitySuccessViewController *vc = [QXHIdentitySuccessViewController new];
            vc.successType = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [MBProgressHUD showError:response.msg toView:self.view];
        }
        
    } failure:^(NSError *error) {
        
    } ];
}
- (IBAction)getAuthCode:(id)sender {
    if (self.txtPhoneNumber.text.length == 0) {
        [MBProgressHUD showError:@"请输入手机号码"];
        return;
    }
    NSDictionary *parameters = @{
                                 @"phone":self.txtPhoneNumber.text,
                                 @"send":@(4)
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
