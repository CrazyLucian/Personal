//
//  QXHYaoQingJiLuCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHYaoQingModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHYaoQingJiLuCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *teleLable;
@property (nonatomic, strong) UILabel *moneyLable;
@property (nonatomic, strong) UILabel *timeLable;
- (void)congigUIWithModel:(QXHYaoQingModels *)model;
@end

NS_ASSUME_NONNULL_END
