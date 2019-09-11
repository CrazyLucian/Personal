//
//  QXHMyTeamCardTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamCardTableViewCell.h"

@implementation QXHMyTeamCardTableViewCell


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
        make.height.equalTo(204);
    }];
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(31);
        make.left.equalTo(7);
        make.top.equalTo(7);
    }];
    [self.NameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(9);
        make.centerY.equalTo(self.headImageView.mas_centerY);
    }];
    [self.fanMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-9);
        make.centerY.equalTo(self.headImageView.mas_centerY);
    }];
    [self.cardImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_bottom).offset(6);
        make.left.equalTo(self.headImageView.mas_left);
        make.right.equalTo(-5);
        make.height.equalTo(111);
    }];
    //
    [self.cardName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.cardImageView.mas_bottom).offset(9);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImageView.mas_left);
        make.top.equalTo(self.cardName.mas_bottom).offset(9);
    }];
    [self.guoQiImage makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(59);
        make.height.equalTo(37);
        make.right.equalTo(-5);
        make.bottom.equalTo(-6);
    }];
    
}
/*//头像
 @property (nonatomic, strong) UIImageView *headImageView;
 //姓名
 @property (nonatomic, strong) UILabel *NameLable;
 //返现金额
 @property (nonatomic, strong) UILabel *fanMoneyLable;
 //电话号码
 @property (nonatomic, strong) UILabel *cardName;
 //有效期
 @property (nonatomic, strong) UILabel *timeLable;
 */

-(UIView *)backView{
    if(!_backView){
        _backView = [[UIView alloc]init];
        _backView .backgroundColor = RGBCOLOR(255, 255, 255);
        _backView.layer.shadowColor = RGBA(145, 145, 145, 0.1).CGColor;
        _backView.layer.shadowOffset = CGSizeMake(0,4);
        _backView.layer.shadowOpacity = 1;
        _backView.layer.shadowRadius = 7;
        [self addSubview:_backView];
    }
    return _backView;
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"imageHead"];
        [self.backView addSubview:_headImageView];
    }
    return _headImageView;
}
-(UILabel *)NameLable{
    if (!_NameLable) {
        _NameLable = [[UILabel alloc]init];
        _NameLable.text = @"余潇逸";
        _NameLable.font = [UIFont systemFontOfSize:12];
        _NameLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.backView addSubview:_NameLable];
    }
    return _NameLable;
}
-(UILabel *)fanMoneyLable{
    if (!_fanMoneyLable) {
        _fanMoneyLable = [[UILabel alloc]init];
        _fanMoneyLable.text = @"余潇逸";
        _fanMoneyLable.font = [UIFont systemFontOfSize:12];
        _fanMoneyLable.textColor  = RGBCOLOR(242, 0, 0);
        [self.backView addSubview:_fanMoneyLable];
    }
    return _fanMoneyLable;
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
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"有效期:2019-02-13至2019-03-31";
        _timeLable.font = AppFont(11);
        _timeLable.textColor  = RGBCOLOR(102, 102, 102);
        [self.backView addSubview:_timeLable];
    }
    return _timeLable;
}
-(UIImageView *)guoQiImage{
    if (!_guoQiImage) {
        _guoQiImage = [[UIImageView alloc]init];
        _guoQiImage.image = [UIImage imageNamed:@"jiufuqianbaoicon10"];
        [self.backView addSubview:_guoQiImage];
    }
    return _guoQiImage;
}
-(void)configUIWithModel:(QXHMyCoardModels *)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.NameLable.text = model.nickname;
    self.fanMoneyLable.text = model.status_text;
    //如果是已作废  要显示作废 按钮
    if ([model.status_text isEqualToString:@"已作废"]) {
        [self.guoQiImage setHidden:NO];
    }else{
          [self.guoQiImage setHidden:YES];
    }
    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.cardName.text = model.title;
    self.timeLable.text = [NSString stringWithFormat:@"有效期：%@ 至 %@",model.start_time,model.expire_time];
}
@end
