//
//  QXHPayPasswordViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPayPasswordViewController.h"

@interface QXHPayPasswordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRepassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@end

@implementation QXHPayPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSave.layer.masksToBounds = YES;
    self.btnSave.layer.cornerRadius = 23.5f;
    self.btnGetCode.layer.masksToBounds = YES;
    self.btnGetCode.layer.cornerRadius = 13.f;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)getAuthCode:(id)sender {
}
- (IBAction)saveAction:(id)sender {
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
