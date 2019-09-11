//
//  QXHJoinActivityViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHJoinActivityViewController.h"
#import "QXHShouYinTaiViewController.h"
@interface QXHJoinActivityViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelMaxAmount;
@property (weak, nonatomic) IBOutlet UITextField *txtAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelIncome;
@property (weak, nonatomic) IBOutlet UITextView *txtRules;
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UILabel *labelJoinPrice;

@end

@implementation QXHJoinActivityViewController

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
    self.labelMaxAmount.text = [NSString stringWithFormat:@"您今日可参与金额的最大额度：%@元",self.model.max_prestore_money];
    self.labelJoinPrice.text = [NSString stringWithFormat:@"￥%@",self.model.red_packet_surplus];
    self.txtRules.text = self.model.red_packets_transfer_rule;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self.txtAmount];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)confirmAction:(id)sender {
    if ([self.txtAmount.text integerValue] < 10) {
        [MBProgressHUD showError:@"最小参与金额10元"];
        return;
    }
    if ([self.txtAmount.text integerValue] > 0) {
        QXHShouYinTaiViewController *vc = [QXHShouYinTaiViewController new];
        vc.money = self.txtAmount.text;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [MBProgressHUD showError:@"请输入金额" toView:self.view];
    }
    
}

- (void)textFiledEditChanged:(NSNotification *)obj
{
    UITextField *inputTextField = (UITextField *)obj.object;
    NSString *toBeString = inputTextField.text;

    
            if (toBeString.length >= 10) {
                inputTextField.text = [toBeString substringToIndex:10];
                
            }

    CGFloat floatValue = [inputTextField.text floatValue] * ([self.model.profit_ratio floatValue] / 100) / [self.model.year integerValue];
    if (floatValue < 0.01 && floatValue != 0) {
        floatValue = 0.01;
    }
    self.labelIncome.text = [NSString stringWithFormat:@"￥%.2f",floatValue];
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
