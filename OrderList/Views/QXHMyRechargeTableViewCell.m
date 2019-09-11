//
//  QXHMyRechargeTableViewCell.m
//  quxianghui
//
//  Created by aa on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyRechargeTableViewCell.h"
@interface QXHMyRechargeTableViewCell()
@property (nonatomic, strong)UIView *bacKView;
@property (nonatomic, strong)UIView *lineView;
@end
@implementation QXHMyRechargeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setupUI{
    [self.bacKView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(0);
        make.height.equalTo(67);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.right.equalTo(-12);
        make.height.equalTo(1);
        make.bottom.equalTo(self.bacKView.mas_bottom);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.top.equalTo(17);
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
-(UIView *)bacKView{
    if (!_bacKView) {
        _bacKView = [[UIView alloc]init];
        _bacKView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bacKView];
    }
    return _bacKView;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor =RGBCOLOR(238, 238, 238);
//        _lineView.backgroundColor = [UIColor redColor];
        [self.bacKView addSubview:_lineView];
    }
    return _lineView;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"话费充值";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(51, 51, 51);
        [self.bacKView addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"-28.50";
        _moneyLable.font = [UIFont systemFontOfSize:14];
        _moneyLable.textColor = RGBCOLOR(51, 51, 51);
        [self.bacKView addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @"30元话费-直充";
        _contentLable.font = [UIFont systemFontOfSize:11];
        _contentLable.textColor = RGBCOLOR(136, 136, 136);
        [self.bacKView addSubview:_contentLable];
    }
    return _contentLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019/03/27 10:56";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = RGBCOLOR(136, 136, 136);
        [self.bacKView addSubview:_timeLable];
    }
    return _timeLable;
}
- (void)bindGoodsModel:(QXHMyRechargeModels*)model{
    self.nameLable.text = model.title;
    self.moneyLable.text =[NSString stringWithFormat:@"- %@",model.money]; 
    self.contentLable.text = model.content;
    self.timeLable.text = model.create_time;
}
@end
