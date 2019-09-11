//
//  QXHPersonalMenuCollectionViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalMenuCollectionViewCell.h"

@implementation QXHPersonalMenuCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor whiteColor];
}


- (void)bindValueWithName:(NSString*)name imageName:(NSString*)imageName edge:(CGFloat)edge {
    [self.btnImage setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.btnImage setTitle:name forState:UIControlStateNormal];
    [self.btnImage setImagePositionWithType:SSImagePositionTypeTop spacing:edge];
}


@end
