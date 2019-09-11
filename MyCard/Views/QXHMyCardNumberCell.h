//
//  QXHMyCardNumberCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHmyCardDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardNumberCell : UITableViewCell
//卡号
@property (nonatomic, strong) UILabel *cardName;
//密码
@property (nonatomic, strong) UILabel *cardNumber;
//复制按钮
@property (nonatomic, strong) UIButton *fuButton;
@end

NS_ASSUME_NONNULL_END
