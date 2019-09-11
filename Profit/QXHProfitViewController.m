//
//  QXHProfitViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHProfitViewController.h"
#import "QXHMonthIncomeTableViewCell.h"
#import "QXHDayIncomeTableViewCell.h"
#import "QXHOtherMonthIncomeTableViewCell.h"
#import "QXHPersonalModel.h"
@interface QXHProfitViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation QXHProfitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.dataArr = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewReload:) name:@"reloadIncomeDataNotification" object:nil];
    self.navigationController.navigationBarHidden = YES;
    
//    app/user_earnings_record
    
    // Do any additional setup after loading the view.
}
-(void)tableViewReload:(NSNotification *)noti{
    [self.dataArr addObjectsFromArray:noti.userInfo[@"array"]];
        [self.tableView reloadData];
    
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-LL_BarHeight)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [_tableView registerNib:[UINib nibWithNibName:@"QXHDayIncomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHDayIncomeTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"QXHMonthIncomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHMonthIncomeTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"QXHOtherMonthIncomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHOtherMonthIncomeTableViewCell"];
        
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 98.f;
    } else{
        return 110.f;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (self.type == 0) {
            QXHMonthIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMonthIncomeTableViewCell"];
            if (self.dataArr.count > 0) {
                [cell loadCellDataWithModel:self.dataArr[self.type]];
            }
            return cell;
        }else{
            
            QXHOtherMonthIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHOtherMonthIncomeTableViewCell"];
            if (self.dataArr.count > 0) {
                [cell loadCellDataWithModel:self.dataArr[self.type]];
            }
            return cell;
        }
        
    } else if (indexPath.section == 1) {
        QXHDayIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHDayIncomeTableViewCell"];
        if (self.dataArr.count > 0) {
            [cell loadCellDataWithModel:self.dataArr[self.type] type:self.type isToday:1];
        }
        return cell;
    } else {
        QXHDayIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHDayIncomeTableViewCell"];
        if (self.dataArr.count > 0) {
            [cell loadCellDataWithModel:self.dataArr[self.type] type:self.type isToday:0];
        }
        //        [cell bindGoodsModel:self.goodsModels[indexPath.row-1]];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
