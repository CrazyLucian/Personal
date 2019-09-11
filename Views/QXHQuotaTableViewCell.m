//
//  QXHQuotaTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHQuotaTableViewCell.h"

@implementation QXHQuotaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelTag.layer.masksToBounds = YES;
    self.labelTag.layer.cornerRadius = 7.f;
    self.labelTag.layer.borderColor = [UIColor qmui_colorWithHexString:@"aaaaaa"].CGColor;
    self.labelTag.layer.borderWidth = 1;
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
