//
//  QXHMyTeamRechargeCell.m
//  quxianghui
//
//  Created by aa on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamRechargeCell.h"
@interface QXHMyTeamRechargeCell()
@property (nonatomic, strong)UIView *bacKNewView;
@property (nonatomic, strong)UIView *lineView;
@end
@implementation QXHMyTeamRechargeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setupUI{
    [self.bacKNewView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(0);
        make.height.equalTo(106);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.right.equalTo(-12);
        make.height.equalTo(1);
        make.bottom.equalTo(self.bacKNewView.mas_bottom);
    }];
    [self.personHead makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(31);
        make.left.equalTo(12);
        make.top.equalTo(12);
    }];
    [self.nickName makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.personHead.mas_centerY);
        make.left.equalTo(self.personHead.mas_right).offset(9);
    }];
    [self.fanXianLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.personHead.mas_centerY);
        make.right.equalTo(-13);
    }];
    
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.top.equalTo(self.personHead.mas_bottom).offset(14);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLable.mas_centerY);
        make.right.equalTo(-13);
    }];
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLable.mas_left);
        make.top.equalTo(self.nameLable.mas_bottom).offset(11);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentLable.mas_centerY);
        make.right.equalTo(-13);
    }];
}
-(UIView *)bacKNewView{
    if (!_bacKNewView) {
        _bacKNewView = [[UIView alloc]init];
        _bacKNewView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bacKNewView];
    }
    return _bacKNewView;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor =RGBCOLOR(238, 238, 238);
        //        _lineView.backgroundColor = [UIColor redColor];
        [self.bacKNewView addSubview:_lineView];
    }
    return _lineView;
}
-(UIImageView *)personHead{
    if (!_personHead) {
        _personHead = [[UIImageView alloc]init];
        _personHead.layer.cornerRadius = 6;
        _personHead.layer.masksToBounds = YES;
        _personHead.image = [UIImage imageNamed:@"色阶 661 拷贝"];
        [self.bacKNewView addSubview:_personHead];
    }
    return _personHead;
}
-(UILabel *)nickName{
    if (!_nickName) {
        _nickName = [[UILabel alloc]init];
        _nickName.text = @"我的姓名是 XXXX";
        _nickName.font = [UIFont systemFontOfSize:12];
        _nickName.textColor = RGBCOLOR(51, 51, 51);
        [self.bacKNewView addSubview:_nickName];
    }
    return _nickName;
}
-(UILabel *)fanXianLable{
    if (!_fanXianLable) {
        _fanXianLable = [[UILabel alloc]init];
        _fanXianLable.text = @"返现￥0.50";
        _fanXianLable.font = [UIFont systemFontOfSize:12];
        _fanXianLable.textColor = RGBCOLOR(242, 0, 0);
        [self.bacKNewView addSubview:_fanXianLable];
    }
    return _fanXianLable;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"话费充值";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(51, 51, 51);
        [self.bacKNewView addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"-28.50";
        _moneyLable.font = [UIFont systemFontOfSize:14];
        _moneyLable.textColor = RGBCOLOR(51, 51, 51);
        [self.bacKNewView addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @"30元话费-直充";
        _contentLable.font = [UIFont systemFontOfSize:11];
        _contentLable.textColor = RGBCOLOR(136, 136, 136);
        [self.bacKNewView addSubview:_contentLable];
    }
    return _contentLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019/03/27 10:56";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = RGBCOLOR(136, 136, 136);
        [self.bacKNewView addSubview:_timeLable];
    }
    return _timeLable;
}
- (void)bindGoodsModel:(QXHMyRechargeModels*)model{
    self.nameLable.text = model.title;
    self.nickName.text = model.nickname;
    self.moneyLable.text =[NSString stringWithFormat:@"- %@",model.money];
    self.contentLable.text = model.content;
    self.timeLable.text = model.create_time;
    self.fanXianLable.text = [NSString stringWithFormat:@"返现￥%@",model.return_commission];
    [self.personHead sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"placeholderImage1"]];
}
@end
