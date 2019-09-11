//
//  QXHMyCollectionCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/26.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCollectionCell.h"

@implementation QXHMyCollectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)setupUI{
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(9);
        make.top.equalTo(8);
        make.width.height.equalTo(126);
    }];
    [self.tianMaoLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_top);
        make.left.equalTo(self.headImageView.mas_right).offset(12);
        make.width.equalTo(28);
        make.height.equalTo(14);
    }];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_top);
        make.left.equalTo(self.headImageView.mas_right).offset(12);
        make.right.equalTo(-15);
    }];
    [self.moneyLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(12);
        make.top.equalTo(self.titleLable.mas_bottom).offset(14);
    }];
    [self.tianMaoMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.moneyLabel .mas_bottom);
        make.left.equalTo(self.headImageView.mas_right).offset(65);
    }];
    [self.xiaoLiangNumber makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.headImageView.mas_right).offset(12);
        make.top.equalTo(self.moneyLabel.mas_bottom).offset(19);
    }];
    [self.shouYiLable makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(108);
        make.height.equalTo(16);
        make.right.equalTo(-13);
        make.bottom.equalTo(self.headImageView.mas_bottom).offset(-5);
    }];
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"huiyuan"];
        [self addSubview:_headImageView];
    }
    return _headImageView;
}
-(UILabel *)tianMaoLable{
    if (!_tianMaoLable) {
        _tianMaoLable = [[UILabel alloc]init];
        _tianMaoLable.text = @"淘宝";
        _tianMaoLable.textAlignment = NSTextAlignmentCenter;
        _tianMaoLable.layer.borderWidth = 1;
        _tianMaoLable.layer.borderColor = RGBCOLOR(235, 92, 41).CGColor;
        _tianMaoLable.textColor = RGBCOLOR(235, 92, 41);
        _tianMaoLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:_tianMaoLable];
    }
    return _tianMaoLable;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"          羽毛台灯卧室床头创意时尚浪漫现代简约暖色婚庆";
        _titleLable.numberOfLines = 2;
        _titleLable.textColor = RGBCOLOR(51, 51, 51);
        _titleLable.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.text = @"¥ 16.9";
        _moneyLabel.textColor = RGBCOLOR(233, 51, 64);
        _moneyLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_moneyLabel];
    }
    return _moneyLabel;
}
-(UILabel *)tianMaoMoneyLable{
    if (!_tianMaoMoneyLable) {
        _tianMaoMoneyLable = [[UILabel alloc]init];
        _tianMaoMoneyLable.text = @"天猫价 ¥ 16.9";
        _tianMaoMoneyLable.textColor = RGBCOLOR(136, 136, 136);
        _tianMaoMoneyLable.font = [UIFont systemFontOfSize:11];
        [self addSubview:_tianMaoMoneyLable];
    }
    return _tianMaoMoneyLable;
}
-(UILabel *)xiaoLiangNumber{
    if (!_xiaoLiangNumber) {
        _xiaoLiangNumber = [[UILabel alloc]init];
        _xiaoLiangNumber.text = @"已售 1443";
        _xiaoLiangNumber.textColor = RGBCOLOR(136, 136, 136);
        _xiaoLiangNumber.font = [UIFont systemFontOfSize:11];
        [self addSubview:_xiaoLiangNumber];
    }
    return _xiaoLiangNumber;
}
-(UILabel *)shouYiLable{
    if (!_shouYiLable) {
        _shouYiLable = [[UILabel alloc]init];
        _shouYiLable.text = @"预估收益：¥2.94";
        _shouYiLable.textColor = RGBCOLOR(245, 82, 60);
        _shouYiLable.font = [UIFont systemFontOfSize:11];
        _shouYiLable.textAlignment = NSTextAlignmentCenter;
        _shouYiLable.backgroundColor = RGBCOLOR(251, 234, 234);
        [self addSubview:_shouYiLable];
    }
    return _shouYiLable;
}

- (void)bindGoodsModel:(QXHGoodDetailModel*)model {
    self.titleLable.text = [NSString stringWithFormat:@"          %@",model.itemtitle];
//    self.subtitleLabel.text = model.itemdesc;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.itempic]];
    self.xiaoLiangNumber.text = [NSString stringWithFormat:@"已售 %@",model.itemsale];
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%@",model.itemendprice];
    self.tianMaoMoneyLable.text =[NSString stringWithFormat:@"￥%@",model.itemendprice];
    //  self.quanLabel.text = [NSString stringWithFormat:@"%@元券",model.couponmoney];
//    float zhuanMoney = ([model.itemendprice floatValue] * ([model.tkrates floatValue]/100));
    NSString *selfRatio = [QXHUserDefaults readUserDefaultObjectValueForKey:APPSELFZheKou];
    float newSelfRatio = [selfRatio floatValue];
    float goodsZheKou = [model.tkmoney floatValue];
    NSString *zheKouMoney = [NSString stringWithFormat:@"%.2f",newSelfRatio * goodsZheKou];
    self.shouYiLable.text = [NSString stringWithFormat:@"预估收益:%@",zheKouMoney];
    self.shouYiLable.text = [NSString stringWithFormat:@"预估收益:%@",model.tkmoney];
    if ([model.shoptype isEqualToString:@"B"]) {
        self.tianMaoLable.text = @"天猫";
    }else{
        self.tianMaoLable.text = @"淘宝";
    }
//    self.quanLabel.text = [NSString stringWithFormat:@"%@元券",model.couponmoney];
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",model.itemprice]
//                                                                                attributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)}];
//    self.salePriceLabel.attributedText = attrStr;
    
    
}
@end
