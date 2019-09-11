//
//  QXHAssociatedAccountTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/14.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHAssociatedAccountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgAccount;
@property (weak, nonatomic) IBOutlet UILabel *labelAccountName;
@property (weak, nonatomic) IBOutlet UISwitch *cellSwitch;
@property (weak, nonatomic) IBOutlet UIView *viewInput;
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgViewHeight;
@property (weak, nonatomic) IBOutlet UIButton *btnSwitch;

@property (nonatomic, copy) void (^returnSwitchBlock)(NSInteger);
@property (nonatomic, copy) void (^returnconfirmBlock)(NSString *);
@property (nonatomic, copy) void (^returnEditBlock)(NSString *);

-(void)refreshCellWithState:(BOOL)state model:(QXHUserInfoModel *)model row:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
