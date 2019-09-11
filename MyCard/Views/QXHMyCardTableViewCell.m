//
//  QXHMyCardTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardTableViewCell.h"

@implementation QXHMyCardTableViewCell

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
//        [_guoQiImage setHidden:YES];
        [self.backView addSubview:_guoQiImage];
    }
    return _guoQiImage;
}
-(void)configUIWithModel:(QXHMyCardModels *)model{
    self.cardName.text = model.title;
    self.timeLable.text = [NSString stringWithFormat:@"有效期:%@至%@ ",model.start_time,model.expire_time];
    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
}
@end
