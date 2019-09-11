//
//  QXHMyTeamCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamCell.h"
@interface QXHMyTeamCell()
@property (nonatomic, strong) UIView *lineView;
@end
@implementation QXHMyTeamCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(36);
        make.left.equalTo(15);
        make.top.equalTo(19);
    }];
    [self.NameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(7);
        make.top.equalTo(25);
    }];
    
    [self.jiBieImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(37);
        make.height.equalTo(12);
        make.left.equalTo(self.headImageView.mas_right).offset(7);
        make.top.equalTo(self.NameLable.mas_bottom).offset(5);
    }];
    
    [self.teleLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.headImageView.mas_right).offset(129);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
//        make.width.equalTo(63);
//        make.height.equalTo(10);
        make.right.equalTo(-16);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.height.equalTo(1);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"新手帮助(1)"];
        _headImageView.layer.cornerRadius = 18;
        _headImageView.layer.masksToBounds  = YES;
        [self addSubview:_headImageView];
    }
    return _headImageView;
}
-(UILabel *)NameLable{
    if (!_NameLable) {
        _NameLable = [[UILabel alloc]init];
        _NameLable.text = @"余潇逸";
        _NameLable.font = [UIFont systemFontOfSize:12];
        _NameLable.textColor  = RGBCOLOR(51, 51, 51);
        [self addSubview:_NameLable];
    }
    return _NameLable;
}
-(UIImageView *)jiBieImageView{
    if (!_jiBieImageView) {
        _jiBieImageView = [[UIImageView alloc]init];
        _jiBieImageView.image = [UIImage imageNamed:@"合伙人 拷贝"];
        [self addSubview:_jiBieImageView];
    }
    return _jiBieImageView;
}

-(UILabel *)teleLable{
    if (!_teleLable) {
        _teleLable = [[UILabel alloc]init];
        NSString *teleNmuber = @"15664086618";
        NSString *numberString = [teleNmuber stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        _teleLable.text = numberString;
        _teleLable.font = [UIFont systemFontOfSize:12];
        _teleLable.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_teleLable];
    }
    return _teleLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019.01.20";
        _timeLable.font = [UIFont systemFontOfSize:12];
        _timeLable.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_timeLable];
    }
    return _timeLable;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBA(202, 202, 202, 1);
         [self addSubview:_lineView];
    }
    return _lineView;
}
-(void)configUIWithModel:(QXHMyTeamNumberContentModels *)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.NameLable.text = model.nickname;
    self.teleLable.text = model.phone;
    self.timeLable.text = model.create_time_text;
    if ([model.level isEqualToString:@"1"]) {
        self.jiBieImageView.image = [UIImage imageNamed:@"普通 拷贝 5"];
        
    }else if ([model.level isEqualToString:@"2"]){
        self.jiBieImageView.image = [UIImage imageNamed:@"huangjinhuiyuan 拷贝"];
    }else if ([model.level isEqualToString:@"3"]){
        self.jiBieImageView.image = [UIImage imageNamed:@"钻石 拷贝"];
    }else if ([model.level isEqualToString:@"4"]){
        self.jiBieImageView.image = [UIImage imageNamed:@"合伙人 拷贝"];
    }
}
@end
