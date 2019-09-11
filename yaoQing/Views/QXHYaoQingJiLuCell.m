//
//  QXHYaoQingJiLuCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHYaoQingJiLuCell.h"
@interface QXHYaoQingJiLuCell()
@property (nonatomic, strong) UIView *lineView;
@end

@implementation QXHYaoQingJiLuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)createUI{
    [self.headView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(47);
        make.centerY.equalTo(self);
        make.left.equalTo(15);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_top);
        make.left.equalTo(self.headView.mas_right).offset(15);
    }];
    [self.teleLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headView.mas_bottom);
        make.left.equalTo(self.headView.mas_right).offset(15);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLable.mas_top);
        make.right.equalTo(-15);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teleLable.mas_top);
        make.right.equalTo(-15);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(14);
        make.right.equalTo(-14);
        make.height.equalTo(1);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
-(UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc]init];
        _headView.image = [UIImage imageNamed:@"right_to"];
        [self addSubview:_headView];
    }
    return _headView;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"不二臣";
        _nameLable.font = [UIFont systemFontOfSize:14];
        _nameLable.textColor = RGBCOLOR(102, 102, 102);
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)teleLable{
    if (!_teleLable) {
        _teleLable = [[UILabel alloc]init];
        _teleLable.text = @"147****8593";
        _teleLable.font = [UIFont systemFontOfSize:13];
        _teleLable.textColor = RGBCOLOR(102, 102, 102);
        [self addSubview:_teleLable];
    }
    return _teleLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"+￥12.00";
        _moneyLable.font = [UIFont systemFontOfSize:13];
        _moneyLable.textColor = RGBCOLOR(224, 0, 0);
        [self addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019-04-16";
        _timeLable.font = [UIFont systemFontOfSize:13];
        _timeLable.textColor = RGBCOLOR(102, 102, 102);
        [self addSubview:_timeLable];
    }
    return _timeLable;
}
-(UIView *)lineView{
    if (_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(241, 241, 241);
        [self addSubview:_lineView];
    }
    return _lineView;
}
- (void)congigUIWithModel:(QXHYaoQingModels *)model{
//    [self.headView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    [self.headView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"placeholderImage1"]];
    self.nameLable.text = model.nickname;
    self.teleLable.text = model.phone;
    self.timeLable.text = model.spread_time;
    self.moneyLable.text = [NSString stringWithFormat:@"+%@",model.amount];
}
@end
