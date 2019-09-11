//
//  QXHMyTaskDetailCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTaskDetailCell.h"
#import "QXHMyTaskJinDuTiaoCell.h"
@interface QXHMyTaskDetailCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSDictionary *numDictionary;
@property (nonatomic, strong) NSArray *nameArr;
@end
@implementation QXHMyTaskDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.nameArr = @[@"闲乐任务",@"疯狂淘金",@"海量悬赏",@"应用试客",@"赚多多"];
        self.numDictionary = [[NSDictionary alloc]init];
        [self.contentView addSubview:self.tableView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 269)
                      style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHMyTaskJinDuTiaoCell class] forCellReuseIdentifier:@"QXHMyTaskJinDuTiaoCell"];
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHMyTaskJinDuTiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHMyTaskJinDuTiaoCell"];
    cell.backgroundColor =RGBCOLOR(250, 250, 250);
    NSString *stringNew = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    if (![self.numDictionary isKindOfClass:[NSNull class]]) {
            NSString *money = [NSString stringWithFormat:@"%@",self.numDictionary[@"num"][stringNew]];
        cell.numberLable.text = money;
        cell.nameLable.text = self.nameArr[indexPath.row];
    }
    return cell;
}
- (void)bindGoodsModel:(NSDictionary *)model{
    self.numDictionary = model;
    [self.tableView reloadData];
}
@end
