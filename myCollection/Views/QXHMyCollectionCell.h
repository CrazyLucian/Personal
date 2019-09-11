//
//  QXHMyCollectionCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/26.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCollectionCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *tianMaoLable;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *tianMaoMoneyLable;
@property (nonatomic, strong) UILabel *xiaoLiangNumber;
@property (nonatomic, strong) UILabel *shouYiLable;
- (void)bindGoodsModel:(QXHGoodDetailModel*)model;
@end

NS_ASSUME_NONNULL_END
