//
//  QXHVerifyPhoneNumberViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/14.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHVerifyPhoneNumberViewController.h"
#import "QXHUpdatePhoneNumberViewController.h"
#import "MQVerCodeInputView.h"
@interface QXHVerifyPhoneNumberViewController (){
    NSInteger secondCountDown;
}
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UILabel *labelPhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;
@property (nonatomic, strong) NSTimer *countDownTimer;
@property (nonatomic, copy) NSString *phone;
@end

@implementation QXHVerifyPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showCodeInput];
    self.btnGetCode.layer.masksToBounds = YES;
    self.btnGetCode.layer.cornerRadius = 13.f;
    NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
    
    QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
    self.phone = model.phone;
    self.labelPhoneNumber.text = [model.phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    // Do any additional setup after loading the view from its nib.
}
-(void)showCodeInput{
    MQVerCodeInputView *verView = [[MQVerCodeInputView alloc]initWithFrame:CGRectMake(30, 230, SCREEN_WIDTH-60, 50)];
    verView.maxLenght = 6;//最大长度
    verView.keyBoardType = UIKeyboardTypeNumberPad;
    [verView mq_verCodeViewWithMaxLenght];
    verView.block = ^(NSString *text){
        NSLog(@"text = %@",text);
        if (text.length > 5) {
            [self validateCode:text];
        }
    };
    [self.codeView addSubview:verView];
}
-(void)validateCode:(NSString *)code{
    
    
    NSDictionary *parameters = @{
                                 @"phone":self.phone,
                                 @"code":code,
                                 @"send":@(4)
                                 };
    
    [QXHPUTRequest validateCodeWithParameters:parameters success:^(Response *response) {
        if (response.code == 1) {
            QXHUpdatePhoneNumberViewController *vc = [QXHUpdatePhoneNumberViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [MBProgressHUD showError:@"验证码错误" toView:self.view];
        }
        
    } failure:^(NSError *error) {
        
    } ];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)getCode:(id)sender {
    NSDictionary *parameters = @{
                                 @"phone":self.phone,
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
