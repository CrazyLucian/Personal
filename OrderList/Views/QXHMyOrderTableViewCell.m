//
//  QXHMyOrderTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyOrderTableViewCell.h"
@interface QXHMyOrderTableViewCell()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *lineView;
@end
@implementation QXHMyOrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y += 10;//整体向下 移动10
//    frame.size.height -= 10;//间隔为10
//    [super setFrame:frame];
//}
-(void)setupUI{
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(-10);
        make.width.equalTo(345);
        make.height.equalTo(145);
    }];
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(89);
        make.left.equalTo(10);
        make.top.equalTo(10);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_top);
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.right.equalTo(-10);
    }];
    [self.numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLable.mas_bottom).offset(10);
        make.left.equalTo(self.nameLable.mas_left);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLable.mas_left);
        make.bottom.equalTo(self.headImageView.mas_bottom);
    }];
    [self.zhuanLable makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(78);
        make.height.equalTo(20);
        make.right.equalTo(self.nameLable.mas_right);
        make.bottom.equalTo(self.moneyLable.mas_bottom);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.right.equalTo(-10);
        make.height.equalTo(1);
        make.top.equalTo(self.headImageView.mas_bottom).offset(14);
    }];
    [self.orderNumberLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_left);
        make.top.equalTo(self.lineView.mas_bottom).offset(9);
    }];
    [self.zhuangTaiLable makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(52);
        make.height.equalTo(20);
        make.right.equalTo(-11);
        make.centerY.equalTo(self.orderNumberLable.mas_centerY);
    }];
}
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        _backView.layer.shadowColor = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:0.2].CGColor;
        _backView.layer.shadowOffset = CGSizeMake(3,2);
        _backView.layer.shadowOpacity = 1;
        _backView.layer.shadowRadius = 4;
        _backView.layer.cornerRadius = 5;
        [self addSubview:_backView];
    }
    return _backView;
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"色阶 661 拷贝"];
        [self.backView addSubview:_headImageView];
    }
    return _headImageView;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"PC中文正版steam游戏 Artifact卡牌DOTA2卡牌游戏 武装号召卡套装...";
        _nameLable.numberOfLines = 2;
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(51, 51, 51);
        [self.backView addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc]init];
        _numberLable.text = @"x1";
        _numberLable.font = [UIFont systemFontOfSize:12];
        _numberLable.textColor = RGBCOLOR(102, 102, 102);
        [self.backView  addSubview:_numberLable];
    }
    return _numberLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"￥20.00";
        _moneyLable.textColor =RGBCOLOR(245, 112, 128);
        _moneyLable.font = [UIFont systemFontOfSize:16];
        [self.backView  addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)zhuanLable{
    if (!_zhuanLable) {
        _zhuanLable = [[UILabel alloc]init];
        _zhuanLable.text = @"自买省￥1.07";
        _zhuanLable.textAlignment = NSTextAlignmentCenter;
        _zhuanLable.font = [UIFont systemFontOfSize:10];
        _zhuanLable.layer.cornerRadius = 10;
        _zhuanLable.textColor = RGBCOLOR(255, 255, 255);
        [_zhuanLable az_setGradientBackgroundWithColors:@[RGBCOLOR(249, 200, 124 ),RGBCOLOR(246, 112, 128)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
        [self.backView  addSubview:_zhuanLable];
    }
    return _zhuanLable;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(208, 208, 208);
        [self.backView addSubview:_lineView];
    }
    return _lineView;
}
-(UILabel *)orderNumberLable{
    if (!_orderNumberLable) {
        _orderNumberLable = [[UILabel alloc]init];
        _orderNumberLable.text = @"订单编号：8937472384724";
        _orderNumberLable.font = [UIFont systemFontOfSize:11];
        _orderNumberLable.textColor = RGBCOLOR(136, 136, 136);
        [self.backView  addSubview:_orderNumberLable];
    }
    return _orderNumberLable;
}
-(UILabel *)zhuangTaiLable{
    if (!_zhuangTaiLable) {
        _zhuangTaiLable = [[UILabel alloc]init];
        _zhuangTaiLable.text = @"已结算";
        _zhuangTaiLable.textAlignment = NSTextAlignmentCenter;
        _zhuangTaiLable.font = [UIFont systemFontOfSize:11];
        _zhuangTaiLable.textColor = RGBCOLOR(245, 112, 128);
        _zhuangTaiLable.layer.masksToBounds = YES;
        _zhuangTaiLable.layer.cornerRadius = 5;
        _zhuangTaiLable.layer.borderWidth = 1;
        _zhuangTaiLable.layer.borderColor = RGBCOLOR(245, 112, 128).CGColor;
        [self.backView  addSubview:_zhuangTaiLable];
    }
    return _zhuangTaiLable;
}
- (void)bindGoodsModel:(QXHMyOrderModels*)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];
    self.nameLable.text = model.goods_title;
    self.numberLable.text = [NSString stringWithFormat:@"x %@",model.goods_num];
    self.moneyLable.text = [NSString stringWithFormat:@"¥ %.2f",model.price];
    self.zhuanLable.text =  [NSString stringWithFormat:@"预估赚 ¥ %.2f",model.return_commission];
    self.orderNumberLable.text = [NSString stringWithFormat:@"订单编号：%@",model.order_no];
    if ([model.is_settlement isEqualToString:@"0"]) {
        self.zhuangTaiLable.text = @"未结清";
    }else{
        self.zhuangTaiLable.text = @"已结清";
    }

}
@end
