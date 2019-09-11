//
//  QXHQuotaTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHQuotaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelLine;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UILabel *labelTag;

@end

NS_ASSUME_NONNULL_END
