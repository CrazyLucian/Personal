//
//  QXHYaoQingViewController.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ShareType) {
    ShareTypeWechatSession,
    ShareTypeWechatTimeLine,
    ShareTypeQQ,
    ShareTypeQZone,
    ShareTypeSina,
    ShareTypeWechatFavorite
};

@interface QXHYaoQingViewController : UIViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
