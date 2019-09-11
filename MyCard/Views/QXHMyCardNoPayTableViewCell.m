//
//  QXHMyCardNoPayTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/27.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardNoPayTableViewCell.h"

@implementation QXHMyCardNoPayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(10);
        make.height.equalTo(168);
    }];
    [self.cardImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(4);
        make.left.equalTo(5);
        make.right.equalTo(-5);
        make.height.equalTo(111);
    }];
    //
    [self.cardName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.cardImageView.mas_bottom).offset(9);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.bottom.equalTo(-12);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.bottom.equalTo(-12);
    }];
    [self.yuanMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyLable.mas_right).offset(13);
        make.bottom.equalTo(-12);
    }];
    [self.fanMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yuanMoneyLable.mas_right).offset(31);
        make.bottom.equalTo(-12);
    }];
    [self.payButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-5);
        make.bottom.equalTo(-7);
        make.width.equalTo(62);
        make.height.equalTo(21);
    }];

    
}

-(UIView *)backView{
    if(!_backView){
        _backView = [[UIView alloc]init];
        _backView .backgroundColor = RGBCOLOR(255, 255, 255);
        [self addSubview:_backView];
    }
    return _backView;
}
-(UIImageView *)cardImageView{
    if (!_cardImageView) {
        _cardImageView = [[UIImageView alloc]init];
        _cardImageView.image = [UIImage imageNamed:@"cardBackImage"];
        [self.backView addSubview:_cardImageView];
    }
    return _cardImageView;
}
-(UILabel *)cardName{
    if (!_cardName) {
        _cardName = [[UILabel alloc]init];
        _cardName.text = @"网易云音乐黄金会员月卡";
        _cardName.font = [UIFont systemFontOfSize:11];
        _cardName.textColor  = RGBCOLOR(102, 102, 102);
        [self.backView addSubview:_cardName];
    }
    return _cardName;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"￥19.80";
        _moneyLable.font = AppFont(15);
        _moneyLable.textColor  = RGBCOLOR(221, 0, 0);
        [self.backView addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)yuanMoneyLable{
    if (!_yuanMoneyLable) {
        _yuanMoneyLable = [[UILabel alloc]init];
        _yuanMoneyLable.font = AppFont(12);
        _yuanMoneyLable.text = @"￥22.00";
        _yuanMoneyLable.textColor =RGBCOLOR(136, 136, 136);
        [self.backView addSubview:_yuanMoneyLable];
    }
    return _yuanMoneyLable;
}

-(UILabel *)fanMoneyLable{
    if (!_fanMoneyLable) {
        _fanMoneyLable = [UILabel labelWithFrame:CGRectMake(0, 0, 10, 10) text:@"返现金额:¥2.00" font:AppFont(10) textColor:RGBCOLOR(108, 108, 108) alignment:NSTextAlignmentCenter];
        [self.backView addSubview:_fanMoneyLable];
    }
    return _fanMoneyLable;
}
-(UIButton *)payButton{
    if (!_payButton) {
        _payButton   = [[UIButton alloc]init];
        _payButton.backgroundColor = [UIColor redColor];
        [_payButton setTitle:@"去支付" forState:UIControlStateNormal];
        _payButton.layer.masksToBounds = YES;
        _payButton.layer.cornerRadius = 11;
        [_payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _payButton.titleLabel.font = AppFont(11);
        [self.backView addSubview:_payButton];
    }
    return _payButton;
}
-(void)configUIWithModel:(QXHMyCardModels *)model{
    self.cardName.text = model.title;
    self.moneyLable.text   = [NSString stringWithFormat:@"¥%@",model.sell_price];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:model.price attributes:attribtDic];
    self.yuanMoneyLable.attributedText   = attribtStr;
    
    
    self.fanMoneyLable.text = @"返现金额:¥0.00";
    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:PLACEHOLDERIMAGE];
}
@end
