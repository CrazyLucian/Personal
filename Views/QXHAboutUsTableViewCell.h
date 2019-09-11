//
//  QXHAboutUsTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHAboutUsTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSArray *labelNames;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *backView;

@end

NS_ASSUME_NONNULL_END
