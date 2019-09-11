//
//  QXHCheckJiLuTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHCheckInModel.h"
#import "QXHDongJieModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHCheckJiLuTableViewCell : UITableViewCell
//name
@property (nonatomic, strong) UILabel *nameLable;
//时间
@property (nonatomic, strong) UILabel *timeLable;
//钱
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UIView *lineView;
-(void)configUIWithModel:(QXHCheckInModel *)model;
-(void)configNewUIWithModel:(QXHDongJieModel *)model;
@end

NS_ASSUME_NONNULL_END
