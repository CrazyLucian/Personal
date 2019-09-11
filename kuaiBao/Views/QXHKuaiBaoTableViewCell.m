//
//  QXHKuaiBaoTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHKuaiBaoTableViewCell.h"
@interface QXHKuaiBaoTableViewCell()
@property (nonatomic, strong) UIView *backView;
@end
@implementation QXHKuaiBaoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
        make.left.equalTo(12);
        make.right.equalTo(-12);
        make.top.equalTo(0);
        make.height.equalTo(108);
    }];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(17);
        make.left.equalTo(16);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.mas_left);
        make.top.equalTo(self.titleLable.mas_bottom).offset(10);
    }];
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLable.mas_left);
        make.right.equalTo(-9);
        make.top.equalTo(self.timeLable.mas_bottom).offset(14);
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
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"系统通知";
        _titleLable.font = [UIFont systemFontOfSize:15];
        _titleLable.textColor = RGBCOLOR(51, 51, 51);
        [self.backView addSubview:_titleLable];
    }
    return _titleLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019年3月3日  11:32";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = RGBCOLOR(153, 153, 153);
        [self.backView addSubview:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @"这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介";
        _contentLable.font = [UIFont systemFontOfSize:11];
        _contentLable.numberOfLines = 2;
        _contentLable.textColor = RGBCOLOR(153, 153, 153);
        [self.backView addSubview:_contentLable];
    }
    return _contentLable;
}
- (void)bindGoodsModel:(QXHKuaiBaoModels*)model{
    self.titleLable.text = @"系统通知";
    self.timeLable.text = model.create_time;
    self.contentLable.text =model.title;
}
@end
