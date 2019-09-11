//
//  QXHMyQuotaViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyQuotaViewController.h"
#import "QXHQuotaTableViewCell.h"
#import "QXHMyQuotaHeaderView.h"
#import "QXHPersonalModel.h"
@interface QXHMyQuotaViewController ()
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (nonatomic, strong) QXHQuotaModel *quotaModel;
@property (nonatomic, strong) QXHMyQuotaHeaderView *headerView;
@end

@implementation QXHMyQuotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.dataArray = [[NSMutableArray alloc] init];
    
    if (@available(iOS 11.0, *)) {
        self.itemTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"QXHMyQuotaHeaderView" owner:self options:nil] firstObject];
    if (kDevice_Is_iPhoneX) {
        self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 439);
    }
    self.itemTableView.tableHeaderView = self.headerView;
    self.itemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.itemTableView registerNib:[UINib nibWithNibName:@"QXHQuotaTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHQuotaTableViewCell"];
    self.itemTableView.estimatedRowHeight = 100.f;
    self.itemTableView.rowHeight = UITableViewAutomaticDimension;
    
    [QXHPUTRequest getMyQuotaWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            NSArray *array = response.body[@"faq"];
            NSMutableArray *muArr = [[NSMutableArray alloc] init];
            for (int i = 0; i < array.count; i ++) {
                QXHFaqModel *model = [QXHFaqModel mj_objectWithKeyValues:array[i]];
                [muArr addObject:model];
            }
            self.quotaModel = [QXHQuotaModel mj_objectWithKeyValues:response.body];
            self.quotaModel.faq = muArr;
            [self.headerView loadViewDataWithModel:self.quotaModel];
            [self.itemTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.quotaModel.faq.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        QXHQuotaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHQuotaTableViewCell"];
    QXHFaqModel *model = self.quotaModel.faq[indexPath.row];
    cell.labelTitle.text = model.question;
    cell.labelContent.text = model.answer;
    cell.labelTag.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
    if (indexPath.row == self.quotaModel.faq.count - 1) {
        cell.labelLine.hidden = YES;
    }
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (IBAction)confirmAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
