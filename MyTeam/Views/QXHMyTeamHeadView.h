//
//  QXHMyTeamHeadView.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHMyTeamNumberModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamHeadView : UIView
//红色背景
@property (nonatomic, strong) UIImageView *bigBackView;
//头像
@property (nonatomic, strong) UIImageView *headImageView;
//姓名
@property (nonatomic, strong) UILabel *NameLable;
//人数
@property (nonatomic, strong) UILabel *numberLable;
@property (nonatomic, strong) UILabel *numberDetailsLable;

//
@property (nonatomic, strong) UILabel *puTongLable;
@property (nonatomic, strong) UILabel *puTongDetailLable;
@property (nonatomic, strong) UILabel *vipLable;
@property (nonatomic, strong) UILabel *vipDetailLable;
@property (nonatomic, strong) UILabel *daiLiLable;
@property (nonatomic, strong) UILabel *daiLiDetailLable;
@property (nonatomic, strong) UILabel *zhiShuHuiYuanLable;
@property (nonatomic, strong) UILabel *hiShuHuiYuanDetailLable;
@property (nonatomic, strong) UILabel *zhiShuXiaJiLable;
@property (nonatomic, strong) UILabel *zhiShuXiaJiDetailLable;
-(void)configUIWithModel:(QXHMyTeamNumberModels *)model;
@end

NS_ASSUME_NONNULL_END
