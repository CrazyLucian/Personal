//
//  QXHRedEnvelopeRecordViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHRedEnvelopeRecordViewController.h"
#import "QXHRedEnvelopeTableViewCell.h"
#import "QXHPersonalModel.h"
@interface QXHRedEnvelopeRecordViewController ()
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation QXHRedEnvelopeRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.itemTableView registerNib:[UINib nibWithNibName:@"QXHRedEnvelopeTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXHRedEnvelopeTableViewCell"];
    if ([self.itemTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.itemTableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    [self getUserWalletInfo];
    // Do any additional setup after loading the view from its nib.
}
-(void)getUserWalletInfo{
    [QXHPUTRequest userWalletRecordWithParameters:@{@"type":@(3)} success:^(Response *response) {
        if (response.code == 1) {
            for (NSDictionary * dic in response.body) {
                NSLog(@"%@",dic);
                QXHPacketRecordModel *model = [QXHPacketRecordModel mj_objectWithKeyValues:dic];
                QXHPacketRecordRemarkModel *remarkModel = [QXHPacketRecordRemarkModel mj_objectWithKeyValues:dic[@"remark"]];
                model.ramerk = remarkModel;
                [self.dataArray addObject:model];
            }
            [self.itemTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return [self.dataArray count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QXHRedEnvelopeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHRedEnvelopeTableViewCell"];
    //    cell.textLabel.text = self.dataArray[indexPath.row];
    [cell loadCellData:self.dataArray[indexPath.row]];
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 66.f;
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
