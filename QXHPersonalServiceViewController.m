//
//  QXHPersonalServiceViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/2.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalServiceViewController.h"

@interface QXHPersonalServiceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelCustomService;
@property (weak, nonatomic) IBOutlet UIButton *btnCopy;

@end

@implementation QXHPersonalServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [QXHPUTRequest getCustomServiceWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            self.labelCustomService.text = response.body[@"service"];
        }
    } failure:^(NSError *error) {
        
    }];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)copyAction:(id)sender {
    [MBProgressHUD showSuccess:@"复制成功"];
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    
    if (self.labelCustomService.text.length > 0) {
        paste.string = self.labelCustomService.text;
    }
    
    NSURL *url = [NSURL URLWithString:@"weixin://"];
    
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    
    if (canOpen) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
            // Fallback on earlier versions
        }
        
    }else{
        
        [MBProgressHUD showError:@"未安装微信"];
        
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
