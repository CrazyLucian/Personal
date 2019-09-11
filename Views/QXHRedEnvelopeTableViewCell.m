//
//  QXHRedEnvelopeTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHRedEnvelopeTableViewCell.h"

@implementation QXHRedEnvelopeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loadCellData:(QXHPacketRecordModel *)model{
    self.labelTime.text = model.create_time;
    self.labelTitle.text = model.ramerk.title;
    self.labelMoney.text = model.amount;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
