//
//  QXHCommonContentViewController.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHCommonContentViewController : QMUICommonViewController
@property (nonatomic, strong) UIImageView *titileIcon;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *contentView;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) NSString *typeID;
@end

NS_ASSUME_NONNULL_END
