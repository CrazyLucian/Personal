//
//  QXHMyTeamCardTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyCoardModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamCardTableViewCell : UITableViewCell
//背景
@property (nonatomic, strong) UIView *backView;
//头像
@property (nonatomic, strong) UIImageView *headImageView;
//姓名
@property (nonatomic, strong) UILabel *NameLable;
//返现金额
@property (nonatomic, strong) UILabel *fanMoneyLable;
//卡片图片
@property (nonatomic, strong) UIImageView *cardImageView;
//电话号码
@property (nonatomic, strong) UILabel *cardName;
//有效期
@property (nonatomic, strong) UILabel *timeLable;
//是否过期
@property (nonatomic, strong) UIImageView *guoQiImage;
-(void)configUIWithModel:(QXHMyCoardModels *)model;
@end

NS_ASSUME_NONNULL_END
