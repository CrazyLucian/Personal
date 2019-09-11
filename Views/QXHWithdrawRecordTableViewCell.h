//
//  QXHWithdrawRecordTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHWithdrawRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelBalance;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

-(void)loadCellData:(QXHPacketRecordModel *)model;
@end

NS_ASSUME_NONNULL_END
