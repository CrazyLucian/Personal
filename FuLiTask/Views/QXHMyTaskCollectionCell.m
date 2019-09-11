//
//  QXHMyTaskCollectionCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTaskCollectionCell.h"
@interface QXHMyTaskCollectionCell()


@end
@implementation QXHMyTaskCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
         [self setupUI];
    }
    return self;
}
-(void)setupUI{
    [self.bigImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(9);
        make.top.equalTo(9);
        make.width.equalTo(105);
         make.height.equalTo(70);
    }];
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(8);
        make.width.equalTo(15);
        make.height.equalTo(15);
    }];
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_left);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(6);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(11);
    }];
}
-(UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc]init];
        _bigImageView.image = [UIImage imageNamed:@"pinkBack"];
        _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bigImageView];
    }
    return _bigImageView;
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"yxyShang"];
        [self.bigImageView addSubview:_iconImageView];
    }
    return _iconImageView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"闲乐收益";
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = RGBCOLOR(255, 255, 255);
        [self.bigImageView addSubview:_nameLabel];
    }
    return _nameLabel;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"1738.83";
        _moneyLable.font = [UIFont systemFontOfSize:12];
        _moneyLable.textColor = RGBCOLOR(255, 255, 255);
        [self.bigImageView addSubview:_moneyLable];
    }
    return _moneyLable;
}
@end
