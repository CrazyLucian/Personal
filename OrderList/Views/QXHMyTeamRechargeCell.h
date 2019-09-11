//
//  QXHMyTeamRechargeCell.h
//  quxianghui
//
//  Created by aa on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyRechargeModels.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamRechargeCell : UITableViewCell
@property (nonatomic, strong) UIImageView *personHead;
@property (nonatomic, strong) UILabel *nickName;
@property (nonatomic, strong) UILabel *fanXianLable;

@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) UILabel *timeLable;
- (void)bindGoodsModel:(QXHMyRechargeModels*)model;
@end

NS_ASSUME_NONNULL_END
