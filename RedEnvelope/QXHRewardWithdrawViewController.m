//
//  QXHRewardWithdrawViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHRewardWithdrawViewController.h"

@interface QXHRewardWithdrawViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelAllAmount;
@property (weak, nonatomic) IBOutlet UITextField *txtAmount;
@property (weak, nonatomic) IBOutlet UITextView *txtRules;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation QXHRewardWithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shadowView.layer.shadowOffset = CGSizeMake(2,3);
    self.shadowView.layer.shadowOpacity = 0.3;
    self.shadowView.layer.shadowRadius = 8;
    if (@available(iOS 11.0, *)) {
        self.baseScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.labelAllAmount.text = [NSString stringWithFormat:@"￥%@",self.model.red_packet_surplus];
    self.txtRules.text = self.model.red_packets_withdraw_rule;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)allWithdraw:(id)sender {
    if ([self.model.red_packet_surplus integerValue] > 0) {
        [QXHPUTRequest redEnvelopeRollOutWithParameters:@{@"money":self.model.red_packet_surplus} success:^(Response *response) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (response.code == 1) {
                [MBProgressHUD showSuccess:response.msg toView:self.view];
            }else{
                [MBProgressHUD showError:response.msg toView:self.view];
            }
            [self backAction:nil];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view];
        }];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }else{
        [MBProgressHUD showError:@"当前余额不足，不能提现" toView:self.view];
    }
}
- (IBAction)confirmWithdraw:(id)sender {
    if ([self.model.red_packet_surplus integerValue] == 0) {
        [MBProgressHUD showError:@"当前余额不足，不能提现"];
        return;
    }
    if (self.txtAmount.text.length > 0) {
        [QXHPUTRequest redEnvelopeRollOutWithParameters:@{@"money":self.txtAmount.text} success:^(Response *response) {
            [MBProgressHUD hideHUDForView:self.view];
            if (response.code == 1) {
                [MBProgressHUD showSuccess:response.msg toView:self.view];
            }else{
                [MBProgressHUD showError:response.msg toView:self.view];
            }
            [self backAction:nil];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view];
        }];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }else{
        [MBProgressHUD showError:@"请输入金额" toView:self.view];
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
