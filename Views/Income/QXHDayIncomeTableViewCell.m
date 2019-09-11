//
//  QXHDayIncomeTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHDayIncomeTableViewCell.h"

@implementation QXHDayIncomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model type:(NSInteger)type isToday:(NSInteger)isToday{
    if (isToday == 1) {
        [self.labelDay setTitle:@"今日" forState:UIControlStateNormal];
        self.labelTimes.text = model.todayBs;
        self.labelProfit.text = [NSString stringWithFormat:@"￥%@",model.todayYg];
    }else{
        [self.labelDay setTitle:@"昨日" forState:UIControlStateNormal];
        self.labelTimes.text = model.yesterdayBs;
        self.labelProfit.text = [NSString stringWithFormat:@"￥%@",model.yesterdayYg];
    }
    
    if (type > 0) {
        if (isToday == 1) {
            self.labelProfit.text = [NSString stringWithFormat:@"￥%@",model.todaySy];
        }else{
            self.labelProfit.text = [NSString stringWithFormat:@"￥%@",model.yesterdaySy];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
