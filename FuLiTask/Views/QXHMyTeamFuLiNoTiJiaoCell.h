//
//  QXHMyTeamFuLiNoTiJiaoCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMMyTeamFuLiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamFuLiNoTiJiaoCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *personNameLable;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *timeLable;
@property (nonatomic, strong) UILabel *zhuangTaiLable;
@property (nonatomic, strong) UILabel *moneyLable;
- (void)bindGoodsModel:(QXHMMyTeamFuLiModel*)model;
@end

NS_ASSUME_NONNULL_END
