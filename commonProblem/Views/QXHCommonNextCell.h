//
//  QXHCommonNextCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHCommonProblemModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHCommonNextCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *nextImageView;
- (void)bindGoodsModel:(QXHProblemArrayModels*)model;
@end

NS_ASSUME_NONNULL_END
