//
//  QXHMyTeamViewController.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamViewController : QMUICommonViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *headURL;
@end

NS_ASSUME_NONNULL_END
