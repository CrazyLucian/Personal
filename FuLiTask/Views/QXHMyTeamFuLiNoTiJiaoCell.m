//
//  QXHMyTeamFuLiNoTiJiaoCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamFuLiNoTiJiaoCell.h"
@interface QXHMyTeamFuLiNoTiJiaoCell()
@property (nonatomic, strong) UIView *backView;
@end

@implementation QXHMyTeamFuLiNoTiJiaoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;//整体向下 移动10
    frame.size.height -= 10;//间隔为10
    [super setFrame:frame];
}
-(void)setupUI{
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(14);
        make.top.equalTo(0);
        make.width.equalTo(348);
        make.height.equalTo(107);
    }];
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(31);
        make.top.equalTo(10);
        make.left.equalTo(7);
    }];
    [self.personNameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(9);
        make.centerY.equalTo(self.headImageView.mas_centerY);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(8);
        make.top.equalTo(self.headImageView.mas_bottom).offset(15);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(8);
        make.top.equalTo(self.nameLable.mas_bottom).offset(11);
    }];
    [self.zhuangTaiLable makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(15);
        make.centerY.equalTo(self.nameLable.mas_centerY);
        make.right.equalTo(-10);
    }];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zhuangTaiLable.mas_bottom).offset(10);
        make.right.equalTo(-10);
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
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"简单申请-招商信用卡";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(51, 51, 51);
        [self.backView addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2018/12/26  17:56";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = RGBCOLOR(136, 136, 136);
        [self.backView  addSubview:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)zhuangTaiLable{
    if (!_zhuangTaiLable) {
        _zhuangTaiLable = [[UILabel alloc]init];
        _zhuangTaiLable.text = @"任务进行中";
        _zhuangTaiLable.textColor =RGBCOLOR(233, 46, 21);
        _zhuangTaiLable.layer.borderWidth = 1;
        _zhuangTaiLable.layer.borderColor = RGBCOLOR(233, 46, 21).CGColor;
        _zhuangTaiLable.layer.masksToBounds = YES;
        _zhuangTaiLable.layer.cornerRadius = 3;
        _zhuangTaiLable.font = [UIFont systemFontOfSize:10];
        [self.backView  addSubview:_zhuangTaiLable];
    }
    return _zhuangTaiLable;
}
-(UILabel *)moneyLable{
    if (!_moneyLable) {
        _moneyLable = [[UILabel alloc]init];
        _moneyLable.text = @"￥0.50";
        _moneyLable.font = [UIFont systemFontOfSize:11];
        _moneyLable.textColor = RGBCOLOR(136, 136, 136);
        [self.backView  addSubview:_moneyLable];
    }
    return _moneyLable;
}
-(UILabel *)personNameLable{
    if (!_personNameLable) {
        _personNameLable = [[UILabel alloc]init];
        _personNameLable.text = @"￥利**心";
        _personNameLable.font = [UIFont systemFontOfSize:12];
        _personNameLable.textColor = RGBCOLOR(51, 51, 51);
        [self.backView  addSubview:_personNameLable];
    }
    return _personNameLable;
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"色阶 661"];
        [self.backView addSubview:_headImageView];
    }
    return _headImageView;
}

- (void)bindGoodsModel:(QXHMMyTeamFuLiModel*)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.personNameLable.text = model.nickname;
    self.nameLable.text = model.task_title;
    self.timeLable.text = model.create_time;
    self.zhuangTaiLable.text = [NSString stringWithFormat:@"   %@   ",model.task_source_text];
    self.moneyLable.text  = [NSString stringWithFormat:@"¥ %@",model.return_commission];
}
@end
