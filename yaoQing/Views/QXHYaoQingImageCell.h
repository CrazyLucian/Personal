//
//  QXHYaoQingImageCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHYaoQingImageCell : UITableViewCell
@property (nonatomic, strong) UILabel *contentLable;
- (void)configUIWithModel:(NSMutableArray *)model;
@end

NS_ASSUME_NONNULL_END
