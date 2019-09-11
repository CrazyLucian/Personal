//
//  QXHMyCardNoPayTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/27.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyCardModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardNoPayTableViewCell : UITableViewCell
//背景
@property (nonatomic, strong) UIView *backView;
//卡片图片
@property (nonatomic, strong) UIImageView *cardImageView;
//卡片名称
@property (nonatomic, strong) UILabel *cardName;
//钱
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UILabel *yuanMoneyLable;
@property (nonatomic, strong) UILabel *fanMoneyLable;
@property (nonatomic, strong) UIButton *payButton;
-(void)configUIWithModel:(QXHMyCardModels *)model;

@end

NS_ASSUME_NONNULL_END
