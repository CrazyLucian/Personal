//
//  QXHDayIncomeTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHDayIncomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTimes;
@property (weak, nonatomic) IBOutlet UILabel *labelProfit;
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UIButton *labelDay;
-(void)loadCellDataWithModel:(QXHIncomeDetailModel *)model type:(NSInteger)type isToday:(NSInteger)isToday;
@end

NS_ASSUME_NONNULL_END
