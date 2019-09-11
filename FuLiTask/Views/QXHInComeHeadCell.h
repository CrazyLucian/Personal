//
//  QXHInComeHeadCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHInComeHeadCell : UITableViewCell
//背景黄色图片
@property (nonatomic, strong) UIImageView *yellowView;
//收入money
@property (nonatomic, strong) UILabel *zhuanLable;
//冻结money
@property (nonatomic, strong) UIButton *dongJieiLable;
@end

NS_ASSUME_NONNULL_END
