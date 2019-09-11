//
//  QXHMyTaskJinDuTiaoCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTaskJinDuTiaoCell.h"

@implementation QXHMyTaskJinDuTiaoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setupUI{
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(12);
        make.left.equalTo(16);
    }];
    [self.tiaoLable makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(200);
        make.height.equalTo(10);
        make.left.equalTo(104);
        make.centerY.equalTo(self.nameLable.mas_centerY);
    }];
    [self.numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(12);
        make.right.equalTo(-16);
    }];
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"闲乐任务";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(102, 102, 102);
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
-(UIView *)tiaoLable{
    if (!_tiaoLable) {
        _tiaoLable = [[UIView alloc]init];
        _tiaoLable.layer.masksToBounds = YES;
        _tiaoLable.layer.cornerRadius = 5;
        [_tiaoLable az_setGradientBackgroundWithColors:@[RGBCOLOR(255, 161, 72),RGBCOLOR(255, 122, 41)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
        [self addSubview:_tiaoLable];
    }
    return _tiaoLable;
}
-(UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc]init];
        _numberLable.text = @"12";
        _numberLable.font = [UIFont systemFontOfSize:14];
        _numberLable.textColor = RGBCOLOR(102, 102, 102);
        [self addSubview:_numberLable];
    }
    return _numberLable;
}

@end
