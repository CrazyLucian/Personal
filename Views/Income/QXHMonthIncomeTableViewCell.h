//
//  QXHMonthIncomeTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHMonthIncomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lastMonthYuGuLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthYuGuLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastMonthJieSuanLabel;
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model;
@end

NS_ASSUME_NONNULL_END
