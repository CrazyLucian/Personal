//
//  QXHAccountSafetyViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAccountSafetyViewController.h"
#import "QXHLoginPasswordViewController.h"
#import "QXHPayPasswordViewController.h"
#import "QXHVerifyPhoneNumberViewController.h"
#import "QXHAccountSafetyTableViewCell.h"
@interface QXHAccountSafetyViewController ()
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (nonatomic, strong) NSMutableArray *mineDataArray;
@end

@implementation QXHAccountSafetyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mineDataArray = [[NSMutableArray alloc] init];
    
    NSArray *array = @[@"手机号码",@"登录密码",@"绑定微信"];
    [self.mineDataArray addObjectsFromArray:array];
    [self.itemTableView registerNib:[UINib nibWithNibName:@"QXHAccountSafetyTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHAccountSafetyTableViewCell"];
    if ([self.itemTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.itemTableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
        
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mineDataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QXHAccountSafetyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHAccountSafetyTableViewCell"];
    cell.titleLabel.text = self.mineDataArray[indexPath.row];
    if (indexPath.row == 2) {
        
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 108.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 108)];
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 108);
    imgView.image = [UIImage imageNamed:@"account_safety"];
    [view addSubview:imgView];
    view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        switch (indexPath.row) {
            case 0:
            {
                QXHVerifyPhoneNumberViewController *vc = [[QXHVerifyPhoneNumberViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                
            }
                break;
            case 1:
            {
                QXHLoginPasswordViewController *vc = [QXHLoginPasswordViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
//                QXHPayPasswordViewController *vc = [QXHPayPasswordViewController new];
//                [self.navigationController pushViewController:vc animated:YES];
                [self bingdingWechat];
            }
                break;
            default:
                break;
        }
}
-(void)bingdingWechat{
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        [MBProgressHUD showSuccess:@"未安装微信客户端"];
        return;
    }
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            if (error.code == UMSocialPlatformErrorType_Cancel ) {
                [MBProgressHUD showSuccess:@"取消操作"];
            }
            else{
                [MBProgressHUD showSuccess:error.debugDescription];
            }
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            int login_type = 0;
            NSString *uuid = @"";
            login_type = 2;
            uuid = resp.unionId;
           
            [self bindingWechatAndLogin:uuid];
        };
    }];
    
}
-(void)bindingWechatAndLogin:(NSString *)wechatUUID{
    NSDictionary *parameter = @{@"wechatid":wechatUUID};
    [QXHPUTRequest bindingWechatWithParameters:parameter success:^(Response *response) {
        if (response.code == 1) {
            [MBProgressHUD showMessage:@"微信绑定成功"];
        }else{
            [MBProgressHUD showMessage:response.msg];
        }
    } failure:^(NSError *error) {
        
    }];
    [MBProgressHUD showLoding];
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
