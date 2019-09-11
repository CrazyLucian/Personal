//
//  QXHTeamOrderTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyOrderModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHTeamOrderTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *personHeadView;
@property (nonatomic, strong) UILabel *PersonNameLable;

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *numberLable;
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UILabel *zhuanLable;
@property (nonatomic, strong) UILabel *orderNumberLable;
@property (nonatomic, strong) UILabel *zhuangTaiLable;
- (void)bindGoodsModel:(QXHMyOrderModels*)model;
@end

NS_ASSUME_NONNULL_END
