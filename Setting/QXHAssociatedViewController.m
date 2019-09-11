//
//  QXHAssociatedViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/14.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAssociatedViewController.h"
#import "QXHAlipayAccountViewController.h"
#import "QXHAssociatedAccountTableViewCell.h"
#import "QXHLoginViewController.h"
@interface QXHAssociatedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (nonatomic, strong) NSMutableArray *mineDataArray;
@property (nonatomic, strong) NSMutableArray *cellHeightArray;
@property (nonatomic, strong) QXHUserInfoModel *userModel;
@end

@implementation QXHAssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mineDataArray = [[NSMutableArray alloc] init];
    self.cellHeightArray = [[NSMutableArray alloc] initWithArray:@[@(50),@(50),@(50)]];
    
    NSArray *array = @[@"QQ",@"微信",@"支付宝"];
    [self.mineDataArray addObjectsFromArray:array];
    [self.itemTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MineTableViewCell"];
    if ([self.itemTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.itemTableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
        
    }
    [self.itemTableView registerNib:[UINib nibWithNibName:@"QXHAssociatedAccountTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHAssociatedAccountTableViewCell"];
    self.itemTableView.estimatedRowHeight = 50.f;
    self.itemTableView.rowHeight = UITableViewAutomaticDimension;

    
    [QXHPUTRequest fetchUserInfoWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            
            QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:response.body];
            self.userModel = model;
            [QXHUserDefaults writeUserDefaultObjectValue:response.body withKey:USER_INFO];
            if (self.userModel.qq.length > 0) {
                [self.cellHeightArray replaceObjectAtIndex:0 withObject:@(100)];
            }
            if (self.userModel.wechat.length > 0) {
                [self.cellHeightArray replaceObjectAtIndex:1 withObject:@(100)];
            }
            [self.itemTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mineDataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QXHAssociatedAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHAssociatedAccountTableViewCell"];
    NSArray *imgArr = @[@"qq",@"weixin",@"zhifubao"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelAccountName.text = self.mineDataArray[indexPath.row];
    cell.imgAccount.image = [UIImage imageNamed:imgArr[indexPath.row]];
    if (indexPath.row == 2) {
        cell.btnSwitch.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        if ([self.cellHeightArray[indexPath.row] integerValue] == 50) {
            [cell refreshCellWithState:NO model:self.userModel row:indexPath.row];
        }else{
            [cell refreshCellWithState:YES model:self.userModel row:indexPath.row];
        }
    }
    
    [cell setReturnSwitchBlock:^(NSInteger height){
        [self.cellHeightArray setObject:@(height) atIndexedSubscript:indexPath.row];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.itemTableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
        
    }];
    [cell setReturnconfirmBlock:^(NSString * str) {
        if (str.length > 0) {
            NSString *titleStr;
            if (indexPath.row == 0) {
                titleStr = @"确定绑定QQ账号";
            }else{
                titleStr = @"确定绑定微信账号";
            }
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr
                                                                                     message:str
                                                                              preferredStyle:UIAlertControllerStyleAlert ];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:cancelAction];
            UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self associatedAccountWithAccount:str type:indexPath.row];
                
            }];
            
            [alertController addAction:OKAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    }];
    return cell;
}
-(void)associatedAccountWithAccount:(NSString *)account type:(NSInteger)type{
    NSDictionary *parameter = @{};
    NSMutableDictionary *muparameter = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    if (account.length > 0) {
        if (type == 0) {
            [muparameter setObject:account forKey:@"qq"];
        }else{
            [muparameter setObject:account forKey:@"wechat"];
        }
    }
    [QXHPUTRequest updateUserInfoWithParameters:muparameter success:^(Response *response) {
        if (response.code == 1) {
            [MBProgressHUD showSuccess:response.msg toView:self.view];
            if (type == 0) {
                self.userModel.qq = account;
            }else{
                self.userModel.wechat = account;
            }
        }else{
            [MBProgressHUD showError:response.msg toView:self.view];
        }
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSLog(@"%@",self.cellHeightArray[indexPath.row]);
    
    return [self.cellHeightArray[indexPath.row] floatValue];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        QXHAlipayAccountViewController *vc = [QXHAlipayAccountViewController new];
        [self.navigationController pushViewController:vc animated:YES];
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
