//
//  QXHMyCardDetailHeadCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHmyCardDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardDetailHeadCell : UITableViewCell

//卡片图片
@property (nonatomic, strong) UIImageView *cardImageView;
//卡片名称
@property (nonatomic, strong) UILabel *cardName;
//有效期
@property (nonatomic, strong) UILabel *timeLable;
//z价格
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UILabel *yuanMoneyLable;
@property (nonatomic, strong) UILabel *fanMoneyLable;
-(void)configUIWithModel:(QXHmyCardDetailModel *)model;
@end

NS_ASSUME_NONNULL_END
