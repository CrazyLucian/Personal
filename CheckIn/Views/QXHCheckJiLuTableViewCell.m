//
//  QXHCheckJiLuTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCheckJiLuTableViewCell.h"

@implementation QXHCheckJiLuTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(15);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(self.nameLable.mas_bottom).offset(11);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.height.equalTo(1);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"每日签到";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor  = RGBCOLOR(51, 51, 51);
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2018/12/26 17:56";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor  = RGBCOLOR(136, 136, 136);
        [self addSubview:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"+￥0.50";
        _moneyLable.font = [UIFont systemFontOfSize:13];
        _moneyLable.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_moneyLable];
    }
    return _moneyLable;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(238, 238, 238);
        [self addSubview:_lineView];
    }
    return _lineView;
}
-(void)configUIWithModel:(QXHCheckInModel *)model{
    self.moneyLable.text = model.amount;
    self.timeLable.text = model.create_time;
    self.nameLable.text = model.remark[@"title"];
}
-(void)configNewUIWithModel:(QXHDongJieModel *)model{
    self.moneyLable.text = [NSString stringWithFormat:@"+￥%@",model.amount];
    self.timeLable.text = model.create_time;
    self.nameLable.text = model.title;
}
@end
