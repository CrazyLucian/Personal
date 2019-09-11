//
//  QXHPersonalInfoViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/12.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalInfoViewController.h"
#import "QXHIdentityAuthViewController.h"
#import "WSDatePickerView.h"
#import "QXHUserInfoModel.h"
#import "QXHOSSUploadTool.h"
#import "H_Single_PickerView.h"
#import <SDWebImage/UIButton+WebCache.h>
@interface QXHPersonalInfoViewController ()<H_Single_PickerViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnImage;

@property (weak, nonatomic) IBOutlet UIImageView *imageHeader;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UITextField *txtName;

@property (weak, nonatomic) IBOutlet UITextField *txtSign;
@property (weak, nonatomic) IBOutlet UIButton *btnAge;
@property (weak, nonatomic) IBOutlet UIButton *btnSex;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, strong) NSNumber *gender;
@end

@implementation QXHPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [QXHPUTRequest fetchUserInfoWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            
            QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:response.body];
            [self.imageHeader sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"色阶 661"]];
//            [self.btnImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:nil];
            self.txtName.text = model.nickname;
            if ([model.gender integerValue] == 1) {
                [self.btnSex setTitle:@"男" forState:UIControlStateNormal];
            }else{
                [self.btnSex setTitle:@"女" forState:UIControlStateNormal];
            }
            [self.btnAge setTitle:model.birthday forState:UIControlStateNormal];
            self.txtSign.text = model.signature;
        }
    } failure:^(NSError *error) {
        
    }];
    self.imageHeader.layer.cornerRadius = 39.f;
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)editAction:(id)sender {
    if (self.txtName.enabled == NO) {
        self.txtName.enabled = YES;
        [self.txtName becomeFirstResponder];
    }else{
        [self.txtName resignFirstResponder];
        self.txtName.enabled = NO;
    }
}
- (IBAction)updateUserInfo:(id)sender {

    NSDictionary *parameter = @{@"nickname":self.txtName.text,
                                @"gender":@(1),
                                @"birthday":self.btnAge.titleLabel.text,
                                @"signature":self.txtSign.text
                                };
    NSMutableDictionary *muparameter = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    if (self.imageStr.length > 0) {
        [muparameter setObject:self.imageStr forKey:@"avatar"];
    }
    [QXHPUTRequest updateUserInfoWithParameters:muparameter success:^(Response *response) {
        if (response.code == 1) {
            [MBProgressHUD showSuccess:response.msg toView:self.view];
            [self backAction:nil];
        }else{
            [MBProgressHUD showError:response.msg toView:self.view];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)chooseSex:(id)sender {
    
    //    状态选择0不限，1待审核，2报销中，3报销成功，4报销失败，5审核未通过
    H_Single_PickerView *pickerView = [[H_Single_PickerView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) arr:@[@{@"name":@"男",@"cat_id":@(0)},@{@"name":@"女",@"cat_id":@(1)}]];
    pickerView.delegate = self;
    [self.view endEditing:YES];
    [self.view addSubview:pickerView];
}
- (IBAction)chooseImage:(id)sender {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    //添加Button
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self uploadImg:UIImagePickerControllerSourceTypeCamera];
        
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"相册" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self uploadImg:UIImagePickerControllerSourceTypePhotoLibrary];
        
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController: alertController animated: YES completion: nil];
}
- (void)uploadImg:(UIImagePickerControllerSourceType)xtype{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = xtype;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}
#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    //
    //获取用户选择或拍摄的是照片还是视频
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
        [picker dismissViewControllerAnimated:YES completion:^{

            self.imageHeader.image = image;
            [QXHOSSUploadTool upLoadImage:image success:^(NSString * _Nonnull _Nonnullurl) {
                NSLog(@"%@",_Nonnullurl);
                self.imageStr = _Nonnullurl;
            } failure:^(NSString * _Nonnull _NonnullerrorString) {
                
            }];
        }];
    }
}

#pragma mark - H_Single_PickerViewDelegate
-(void)SinglePickergetObjectWithArr:(H_Single_PickerView *)_h_Single_PickerView arr:(NSArray *)_arr index:(NSInteger)_index chooseStr:(NSString *)chooseStr chooseId:(NSNumber *)chooseId{
    self.gender = @(_index + 1);
    [self.btnSex setTitle:chooseStr forState:UIControlStateNormal];
    
    
    //    NSLog(@"%@",chooseId);
}
- (IBAction)chooseAge:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%@",[self getNowDateFromatAnDate:[NSDate date]]];
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay dateStr:str CompleteBlock:^(NSDate *startDate)  {
        NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd"];
        [self.btnAge setTitle:date forState:UIControlStateNormal];
    }];
    [self.view endEditing:YES];
    //    datepicker.maxLimitDate = [self getNowDateFromatAnDate:[NSDate date]];
    datepicker.doneButtonColor = [UIColor qmui_colorWithHexString:@"5d873b"];//确定按钮的颜色
    [datepicker show];
}
- (IBAction)authIDCard:(id)sender {
    QXHIdentityAuthViewController  *vc = [[QXHIdentityAuthViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  获取本地时间
 */
- (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
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
