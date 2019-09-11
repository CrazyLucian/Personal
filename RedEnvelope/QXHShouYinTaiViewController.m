//
//  QXHShouYinTaiViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHShouYinTaiViewController.h"
#import <AlipaySDK/AlipaySDK.h>
@interface QXHShouYinTaiViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnAlipay;
@property (weak, nonatomic) IBOutlet UIButton *btnBalance;
@property (weak, nonatomic) IBOutlet UILabel *labelBalance;
@property (weak, nonatomic) IBOutlet UIButton *btnPay;

@property (nonatomic, copy) NSString *payMethod;
@end

@implementation QXHShouYinTaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelPrice.text = [NSString stringWithFormat:@"￥%@",self.money];
    self.payMethod = @"alipay";
    NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
    
    QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
    self.labelBalance.text = [NSString stringWithFormat:@"￥%@",model.balance];
    [self.btnPay setTitle:[NSString stringWithFormat:@"￥%@ 立即支付",self.money] forState:UIControlStateNormal];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payResult:) name:@"alipayResultNotification" object:nil];
    // Do any additional setup after loading the view from its nib.
}
-(void)payResult:(NSNotification *)notifi{
    //    PayResultViewModel *viewModel = [[PayResultViewModel alloc]init];
    NSDictionary *userInfo = [notifi userInfo];
    
    [self handlePayResult:userInfo];
}
//处理支付结果
-(void)handlePayResult:(NSDictionary *)resultDic{
    NSNumber *resultStatus = [resultDic objectForKey:@"resultStatus"];
    if ([resultStatus integerValue] == 9000) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD showSuccess:@"支付成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }
    else{
        
        NSString *returnStr = @"";
        switch ([resultStatus integerValue]) {
            case 8000:
                returnStr=@"订单正在处理中";
                break;
            case 4000:
                returnStr=@"订单支付失败";
                break;
            case 6001:
                returnStr=@"支付取消";
                break;
            case 6002:
                returnStr=@"网络连接出错";
                break;
                
            default:
                returnStr=@"支付失败";
                break;
        }
        [MBProgressHUD showError:returnStr];
        
    }
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)chooseAlipay:(id)sender {
    self.btnAlipay.selected = YES;
    self.btnBalance.selected = NO;
    self.payMethod = @"alipay";
}

- (IBAction)chooseBalancePay:(id)sender {
    self.btnAlipay.selected = NO;
    self.btnBalance.selected = YES;
    self.payMethod = @"balance";
}
- (IBAction)payAction:(id)sender {
    NSDictionary *parameter = @{@"money":self.money,
                                @"pay_method":self.payMethod
                                };
    [QXHPUTRequest redEnvelopeRollInWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            if (self.btnAlipay.selected == YES) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *base64Str = response.body[@"params"];
                    NSString *orderStr = [QXHCustomTool dencode:base64Str];
                    //应用注册scheme,在Info.plist定义URL types
                    NSString *appScheme = @"quxianghuiScheme";
                    // NOTE: 调用支付结果开始支付
                    [[AlipaySDK defaultService] payOrder:orderStr fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                        [self handlePayResult:resultDic];
                    }];
                });
                
            }else{
                [MBProgressHUD showSuccess:response.msg toView:self.view];
            }
        }else{
            [MBProgressHUD showError:response.msg toView:self.view];
        }
    } failure:^(NSError *error) {
        
    }];
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
