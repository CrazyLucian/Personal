//
//  QXHAboutUsViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/14.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAboutUsViewController.h"
#import "QXHProfitExplainViewController.h"
@interface QXHAboutUsViewController ()

@end

@implementation QXHAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)checkPrivacyRules:(id)sender {
    QXHProfitExplainViewController *vc = [QXHProfitExplainViewController new];
    vc.type = 1;
    [self.navigationController pushViewController:vc animated:YES];
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
