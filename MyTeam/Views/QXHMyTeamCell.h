//
//  QXHMyTeamCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyTeamNumberModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamCell : UITableViewCell
//头像
@property (nonatomic, strong) UIImageView *headImageView;
//姓名
@property (nonatomic, strong) UILabel *NameLable;
//级别
@property (nonatomic, strong) UIImageView *jiBieImageView;
//电话号码
@property (nonatomic, strong) UILabel *teleLable;
//注册时间
@property (nonatomic, strong) UILabel *timeLable;
-(void)configUIWithModel:(QXHMyTeamNumberContentModels *)model;
@end

NS_ASSUME_NONNULL_END
