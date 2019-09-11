//
//  QXHAlipayAccountViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAlipayAccountViewController.h"
#import "QXHPersonalModel.h"
@interface QXHAlipayAccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtRealName;
@property (weak, nonatomic) IBOutlet UITextField *txtAlipayAccount;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (weak, nonatomic) IBOutlet UIView *viewName;
@property (weak, nonatomic) IBOutlet UIView *viewAccount;

@end

@implementation QXHAlipayAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewName.layer.borderColor = [UIColor qmui_colorWithHexString:@"e9e9e9"].CGColor;
    self.viewName.layer.borderWidth = 1;
    self.viewName.layer.masksToBounds = YES;
    self.viewName.layer.cornerRadius = 23.5f;
    self.viewAccount.layer.borderColor = [UIColor qmui_colorWithHexString:@"e9e9e9"].CGColor;
    self.viewAccount.layer.borderWidth = 1;
    self.viewAccount.layer.masksToBounds = YES;
    self.viewAccount.layer.cornerRadius = 23.5f;
    self.btnConfirm.layer.masksToBounds = YES;
    self.btnConfirm.layer.cornerRadius = 23.5f;
    [self queryUserAlipayInfo];
    // Do any additional setup after loading the view from its nib.
}
-(void)queryUserAlipayInfo{
    [QXHPUTRequest queryAlipayInfoWithParameters:nil success:^(Response *response) {
        QXHAlipayModel *model = [QXHAlipayModel mj_objectWithKeyValues:response.body];
        NSLog(@"%@",response.body);
        if (model.name.length > 0) {
            self.txtRealName.text = model.name;
            self.txtAlipayAccount.text = [model.account stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];;
            self.txtRealName.enabled = NO;
            self.txtAlipayAccount.enabled = NO;
            self.btnConfirm.hidden = YES;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)confirmAction:(id)sender {
    
    NSDictionary *parameter = @{@"name":self.txtRealName.text,
                                @"account":self.txtAlipayAccount.text
                                };
    [QXHPUTRequest bindingAlipayInfoWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            [MBProgressHUD showSuccess:response.msg toView:self.view];
            [self backAction:nil];
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
