//
//  QXHMyQuotaHeaderView.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyQuotaHeaderView.h"

@implementation QXHMyQuotaHeaderView

-(void)loadViewDataWithModel:(QXHQuotaModel *)model{
    self.labelSurplus.text = [NSString stringWithFormat:@"%@",model.surplus_quota];
    self.labelAllQuota.text = [NSString stringWithFormat:@"总额度  %@",model.total_quota];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
