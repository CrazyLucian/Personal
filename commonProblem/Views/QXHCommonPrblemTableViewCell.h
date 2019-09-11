//
//  QXHCommonPrblemTableViewCell.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHCommonPrblemTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconHeadImage;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *firstLable;
@property (nonatomic, strong) UILabel *secondLable;
- (void)congigUIWithArray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
