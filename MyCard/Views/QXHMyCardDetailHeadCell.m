//
//  QXHMyCardDetailHeadCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardDetailHeadCell.h"
@interface QXHMyCardDetailHeadCell()
@property (nonatomic, strong) UIView *lineView;
@end
@implementation QXHMyCardDetailHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.cardImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(14);
        make.right.equalTo(-14);
        make.height.equalTo(114);
        make.top.equalTo(9);
    }];
    [self.cardName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.cardImageView.mas_bottom).offset(14);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.cardName.mas_bottom).offset(13);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.timeLable.mas_bottom).offset(15);
    }];
    [self.yuanMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyLable.mas_right).offset(17);
        make.bottom.equalTo(self.moneyLable.mas_bottom);
    }];
    [self.fanMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-14);
        make.bottom.equalTo(self.moneyLable.mas_bottom);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.bottom.equalTo(-1);
        make.height.equalTo(1);
    }];
    
}


-(UIImageView *)cardImageView{
    if (!_cardImageView) {
        _cardImageView = [[UIImageView alloc]init];
        _cardImageView.image = [UIImage imageNamed:@"cardBackImage"];
        [self addSubview:_cardImageView];
    }
    return _cardImageView;
}
-(UILabel *)cardName{
    if (!_cardName) {
        _cardName = [[UILabel alloc]init];
        _cardName.text = @"网易云音乐黄金会员月卡";
        _cardName.font = [UIFont systemFontOfSize:15];
        _cardName.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_cardName];
    }
    return _cardName;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"有效期： 2019-02-13 至 2019-03-31";
        _timeLable.font = [UIFont systemFontOfSize:12];
        _timeLable.textColor  = RGBCOLOR(153, 153, 153);
        [self addSubview:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"￥19.80";
        _moneyLable.font = [UIFont systemFontOfSize:18];
        _moneyLable.textColor  = RGBCOLOR(221, 0, 0);
        [self addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)yuanMoneyLable{
    if (!_yuanMoneyLable) {
        _yuanMoneyLable = [[UILabel alloc]init];
        _yuanMoneyLable.font = [UIFont systemFontOfSize:12];
        _yuanMoneyLable.textColor  = RGBCOLOR(136, 136, 136);
        [self addSubview:_yuanMoneyLable];
    }
    return _yuanMoneyLable;
}
-(UILabel *)fanMoneyLable{
    if (!_fanMoneyLable) {
        _fanMoneyLable = [[UILabel alloc]init];
        _fanMoneyLable.textColor  = [UIColor redColor];

        _fanMoneyLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:_fanMoneyLable];
    }
    return _fanMoneyLable;
}
-(UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(215, 215, 215);
        [self addSubview:_lineView];
    }
    return _lineView;
}
-(void)configUIWithModel:(QXHmyCardDetailModel *)model{
    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.cardName.text = model.title;
    self.timeLable.text = [NSString stringWithFormat:@"有效期:%@至%@ ",model.start_time,model.expire_time];
    self.moneyLable.text = [NSString stringWithFormat:@"¥%@",model.price];
    
    NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",model.sell_price]];
    [newPrice addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice.length)];
    self.yuanMoneyLable.attributedText = newPrice;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"返现金额：¥%@",model.return_commission]];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    self.fanMoneyLable.attributedText = str;
}
@end
