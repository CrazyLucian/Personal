//
//  QXHPersonalHeaderView.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHUserInfoModel.h"
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN
@class QXHPersonalHeaderView;
@protocol QXHPersonalHeaderDelegate <NSObject>

-(void)personalHeaderView:(QXHPersonalHeaderView *)personalHeaderView clickButton:(NSInteger)index;

@end


@interface QXHPersonalHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnVip;

@property (weak, nonatomic) IBOutlet UIImageView *imageHeader;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelInviteCode;
@property (weak, nonatomic) IBOutlet UIButton *btnSignIn;
@property (weak, nonatomic) IBOutlet UIButton *btnCopy;

@property (weak, nonatomic) IBOutlet UILabel *labelBalance;
@property (weak, nonatomic) IBOutlet UIButton *btnWithdraw;
@property (weak, nonatomic) IBOutlet UILabel *labelThisMonth;
@property (weak, nonatomic) IBOutlet UILabel *labelToday;
@property (weak, nonatomic) IBOutlet UILabel *labelLastMonth;
@property (weak, nonatomic) IBOutlet UILabel *labelYestoday;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;
@property (weak, nonatomic) IBOutlet UIButton *btnQuota;


@property (nonatomic, weak) id<QXHPersonalHeaderDelegate>delegate;
-(void)initViewWithModel:(QXHUserInfoModel *)model;
-(void)refreshProfirData:(QXHIncomeModel *)model;
@end

NS_ASSUME_NONNULL_END
