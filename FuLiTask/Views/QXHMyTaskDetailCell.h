//
//  QXHMyTaskDetailCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTaskDetailCell : UITableViewCell
@property (nonatomic, strong) UITableView *tableView;
- (void)bindGoodsModel:(NSDictionary *)model;
@end

NS_ASSUME_NONNULL_END
