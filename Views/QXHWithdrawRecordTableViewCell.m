//
//  QXHWithdrawRecordTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHWithdrawRecordTableViewCell.h"

@implementation QXHWithdrawRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loadCellData:(QXHPacketRecordModel *)model{
    self.labelTime.text = model.create_time;
    self.labelTitle.text = model.ramerk.title;
    self.labelAmount.text = model.amount;
    self.labelBalance.text = model.balance;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
