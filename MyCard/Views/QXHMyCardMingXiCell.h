//
//  QXHMyCardMingXiCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardMingXiCell : UITableViewCell
//
@property (nonatomic, strong) UIView *leftView;
//优惠
@property (nonatomic, strong) UILabel *mingXinName;
//优惠详情
@property (nonatomic, strong) UILabel *mingXinDatail;
-(void)configUIWithModel:(NSArray *)model;
@end

NS_ASSUME_NONNULL_END
