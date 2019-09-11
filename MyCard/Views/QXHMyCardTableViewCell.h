//
//  QXHMyCardTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyCardModels.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardTableViewCell : UITableViewCell
//背景
@property (nonatomic, strong) UIView *backView;
//卡片图片
@property (nonatomic, strong) UIImageView *cardImageView;
//电话号码
@property (nonatomic, strong) UILabel *cardName;
//有效期
@property (nonatomic, strong) UILabel *timeLable;
//是否过期
@property (nonatomic, strong) UIImageView *guoQiImage;
-(void)configUIWithModel:(QXHMyCardModels *)model;
@end

NS_ASSUME_NONNULL_END
