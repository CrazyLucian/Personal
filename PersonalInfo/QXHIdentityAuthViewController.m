//
//  QXHIdentityAuthViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHIdentityAuthViewController.h"
#import "QXHIdentitySuccessViewController.h"
#import "QXHPersonalModel.h"
@interface QXHIdentityAuthViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewName;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UIView *viewIDCard;
@property (weak, nonatomic) IBOutlet UITextField *txtIDCard;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end

@implementation QXHIdentityAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewName.layer.borderColor = [UIColor qmui_colorWithHexString:@"e9e9e9"].CGColor;
    self.viewName.layer.borderWidth = 1;
    self.viewName.layer.masksToBounds = YES;
    self.viewName.layer.cornerRadius = 23.5f;
    self.viewIDCard.layer.borderColor = [UIColor qmui_colorWithHexString:@"e9e9e9"].CGColor;
    self.viewIDCard.layer.borderWidth = 1;
    self.viewIDCard.layer.masksToBounds = YES;
    self.viewIDCard.layer.cornerRadius = 23.5f;
    self.btnConfirm.layer.masksToBounds = YES;
    self.btnConfirm.layer.cornerRadius = 23.5f;
    [self queryUserIdentityInfo];
    // Do any additional setup after loading the view from its nib.
}
-(void)queryUserIdentityInfo{
    [QXHPUTRequest queryUseridentityInfoWithParameters:nil success:^(Response *response) {
        QXHIdentityModel *model = [QXHIdentityModel mj_objectWithKeyValues:response.body];
        
        if (model.name.length > 0) {
            self.txtName.text = [model.name stringByReplacingCharactersInRange:NSMakeRange(1, model.name.length - 1) withString:@"**********"];
            self.txtName.text = [self.txtName.text substringToIndex:model.name.length];
            self.txtIDCard.text = [model.id_card stringByReplacingCharactersInRange:NSMakeRange(6, 8) withString:@"********"];;
            self.txtName.enabled = NO;
            self.txtIDCard.enabled = NO;
            self.btnConfirm.hidden = YES;
        }
    } failure:^(NSError *error) {
    
    }];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)confirmAction:(id)sender {
    if (self.txtName.text.length == 0) {
        [MBProgressHUD showError:@"请输入姓名"];
        return;
    }
    if (!(self.txtIDCard.text.length == 15 || self.txtIDCard.text.length == 18)) {
        [MBProgressHUD showError:@"请输入15或18位身份证号"];
        return;
    }
    NSDictionary *parameter = @{@"name":self.txtName.text,
                                @"id_card":self.txtIDCard.text
                                };
    [QXHPUTRequest bindingUseridentityInfoWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            QXHIdentitySuccessViewController *vc = [[QXHIdentitySuccessViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
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
