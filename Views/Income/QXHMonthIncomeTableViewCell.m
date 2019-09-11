//
//  QXHMonthIncomeTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMonthIncomeTableViewCell.h"

@implementation QXHMonthIncomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model{
    self.lastMonthYuGuLabel.text = [NSString stringWithFormat:@"￥%@",model.lastmonthYg];
    self.lastMonthJieSuanLabel.text = [NSString stringWithFormat:@"￥%@",model.lastMonthJs];
    self.monthYuGuLabel.text = [NSString stringWithFormat:@"￥%@",model.monthYg];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
