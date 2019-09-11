//
//  QXHMyTaskMoneyTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTaskMoneyTableViewCell : UITableViewCell
- (void)bindGoodsModel:(NSDictionary *)model;
@property (nonatomic, strong) UILabel *nameLable;
@end

NS_ASSUME_NONNULL_END
