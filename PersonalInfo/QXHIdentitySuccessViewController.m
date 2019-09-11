//
//  QXHIdentitySuccessViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHIdentitySuccessViewController.h"

@interface QXHIdentitySuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelInfo;

@end

@implementation QXHIdentitySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnConfirm.layer.masksToBounds = YES;
    self.btnConfirm.layer.cornerRadius = 23.5f;
    if (self.successType == 1) {
        self.labelTitle.text = @"手机号码";
        self.labelInfo.text = @"手机号码绑定成功";
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)confirmAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
