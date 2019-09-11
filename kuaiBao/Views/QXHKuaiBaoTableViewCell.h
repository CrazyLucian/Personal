//
//  QXHKuaiBaoTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHKuaiBaoModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHKuaiBaoTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *timeLable;
@property (nonatomic, strong) UILabel *contentLable;
- (void)bindGoodsModel:(QXHKuaiBaoModels*)model;
@end

NS_ASSUME_NONNULL_END
