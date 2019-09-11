//
//  QXHOtherMonthIncomeTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/9.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHOtherMonthIncomeTableViewCell.h"

@implementation QXHOtherMonthIncomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model{
    self.labelLastMonthProfit.text = [NSString stringWithFormat:@"￥%@",model.lastmonthSy];
    self.labelMonthProfit.text = [NSString stringWithFormat:@"￥%@",model.monthSy];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
