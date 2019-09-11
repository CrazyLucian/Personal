//
//  QXHPersonalSettingViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/13.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalSettingViewController.h"
#import "QXHAccountSafetyViewController.h"
#import "QXHPersonalInfoViewController.h"
#import "QXHAboutUsViewController.h"
#import "QXHAssociatedViewController.h"
#import "QXHLoginViewController.h"
#import <SDImageCache.h>
@interface QXHPersonalSettingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (nonatomic, strong) NSMutableArray *mineDataArray;
@property (nonatomic, copy) NSString *cacheSize;
@end

@implementation QXHPersonalSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mineDataArray = [[NSMutableArray alloc] init];

    NSArray *array = @[@[@"个人资料"],@[@"账户安全",@"关联账号"],@[@"关于我们",@"清除缓存"],@[@"退出账号"]];
    [self.mineDataArray addObjectsFromArray:array];
    [self.itemTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MineTableViewCell"];
    if ([self.itemTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.itemTableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
        
    }
    
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    self.cacheSize = [self getCacheSizeWithFilePath:cachesPath];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.mineDataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.mineDataArray[section] count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell"];
    cell.textLabel.text = self.mineDataArray[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 2 && indexPath.row == 1) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(SCREEN_WIDTH - 200, 12, 160, 20);
        label.text = self.cacheSize;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor qmui_colorWithHexString:@"666666"];
        label.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryNone;
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
    
    return 10.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        QXHPersonalInfoViewController *vc = [QXHPersonalInfoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                QXHAccountSafetyViewController *vc = [QXHAccountSafetyViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1  :
            {
                QXHAssociatedViewController *vc = [QXHAssociatedViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            default:
                break;
        }
    }else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
            {
                QXHAboutUsViewController *vc = [QXHAboutUsViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1  :
            {
                [self cleanButtonAction:nil];
            }
            default:
                break;
        }
    }
    else{
        [self logoutAction];
    }
    
}
-(void)logoutAction{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:@"确定退出登录？"
                                                                      preferredStyle:UIAlertControllerStyleAlert ];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [QXHUserDefaults clearUserDefaultWithKey:USER_INFO];
        [QXHUserDefaults clearUserDefaultWithKey:APPTOKEN];
        QXHLoginViewController *tabbarController = [[QXHLoginViewController alloc] init];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window setRootViewController:tabbarController];
    }];
    
    [alertController addAction:OKAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
// 获取Caches目录路径
- (NSString *)getCachesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
    NSString *cachesDir = [paths lastObject];
    return cachesDir;
}
//2.计算目录大小

- (CGFloat)folderSizeAtPath:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    CGFloat size = 0;
    if ([manager fileExistsAtPath:path]) {
        // 目录下的文件计算大小
        NSArray *childrenFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childrenFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;
        }
        //SDWebImage的缓存计算
        size += [[SDImageCache sharedImageCache] totalDiskSize]/1024.0/1024.0;
        // 将大小转化为M,size单位b,转，KB,MB除以两次1024
        return size / 1024.0 / 1024.0;
    }
    return 0;
}
//3.根据路径删除文件

- (void)cleanCaches:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childrenFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childrenFiles) {
            // 拼接路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 将文件删除
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    //SDWebImage的清除功能
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{

    }];
    [[SDImageCache sharedImageCache] clearMemory];
}
//4.清除缓存按钮的点击事件

- (void)cleanButtonAction:(UIButton *)btn{
    //    CGFloat size = [self folderSizeAtPath:NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject] + [self folderSizeAtPath:NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject] + [self folderSizeAtPath:NSTemporaryDirectory()];

    //    NSString *message = size > 1 ? [NSString stringWithFormat:@"缓存%.2fM", size] : [NSString stringWithFormat:@"缓存%.2fK", size * 1024.0];
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *message = [self getCacheSizeWithFilePath:cachesPath];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"删除缓存" message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self clearCacheWithFilePath:cachesPath];
        //        [self cleanCaches:[self getCachesPath]];

    }];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alertController addAction:action];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (NSString *)getCacheSizeWithFilePath:(NSString *)path{

    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];

    NSString *filePath  = nil;
    NSInteger totleSize = 0;

    for (NSString *subPath in subPathArr){

        // 1. 拼接每一个文件的全路径
        filePath =[path stringByAppendingPathComponent:subPath];
        // 2. 是否是文件夹，默认不是
        BOOL isDirectory = NO;
        // 3. 判断文件是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];

        // 4. 以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            // 过滤: 1. 文件夹不存在  2. 过滤文件夹  3. 隐藏文件
            continue;
        }

        // 5. 指定路径，获取这个路径的属性
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */

        // 6. 获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];

        // 7. 计算总大小
        totleSize += size;
    }

    //8. 将文件夹大小转换为 M/KB/B
    NSString *totleStr = nil;

//    if (totleSize > 1000 * 1000){
        totleStr = [NSString stringWithFormat:@"%.2fM",totleSize / 1000.00f /1000.00f];
//
//    }else if (totleSize > 1000){
//        totleStr = [NSString stringWithFormat:@"%.2fKB",totleSize / 1000.00f ];
//
//    }else{
//        totleStr = [NSString stringWithFormat:@"%.2fB",totleSize / 1.00f];
//    }

    return totleStr;
}
- (BOOL)clearCacheWithFilePath:(NSString *)path{

    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];

    NSString *filePath = nil;

    NSError *error = nil;

    for (NSString *subPath in subPathArr)
    {
        filePath = [path stringByAppendingPathComponent:subPath];

        //删除子文件夹
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    self.cacheSize = [self getCacheSizeWithFilePath:cachesPath];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:1 inSection:2];
    [self.itemTableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
    return YES;
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
