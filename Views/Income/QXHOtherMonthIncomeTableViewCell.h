//
//  QXHOtherMonthIncomeTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/9.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHOtherMonthIncomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelLastMonthProfit;
@property (weak, nonatomic) IBOutlet UILabel *labelMonthProfit;
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model;
@end

NS_ASSUME_NONNULL_END
