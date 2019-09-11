//
//  QXHUserGuideTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHUserGuideTableViewCell.h"
@interface QXHUserGuideTableViewCell()
@property (nonatomic, strong) UIView *backView;
@end
@implementation QXHUserGuideTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 0;//整体向下 移动10
    frame.size.height -= 10;//间隔为10
    [super setFrame:frame];
}
-(void)setupUI{
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(0);
        make.height.equalTo(58);
    }];
    [self.iconHeadImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(31);
        make.centerY.equalTo(self.backView.mas_centerY);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backView.mas_centerY);
        make.left.equalTo(self.iconHeadImage.mas_right).offset(15);
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
        _nameLable.text = @"系统通知";
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = RGBCOLOR(136, 136, 136);
        [self.backView addSubview:_nameLable];
    }
    return _nameLable;
}
-(UIImageView *)iconHeadImage{
    if (!_iconHeadImage) {
        _iconHeadImage = [[UIImageView alloc]init];
        _iconHeadImage.image = [UIImage imageNamed:@"huiyuan"];
        [self.backView addSubview:_iconHeadImage];
    }
    return _iconHeadImage;
}
//- (void)bindGoodsModel:(QXHMyFuLiModel*)model{
//    self.nameLable.text = model.task_title;
//    self.timeLable.text = model.create_time;
//    self.moneyLable.text = [NSString stringWithFormat:@"¥ %@",model.commission];
//    self.zhuangTaiLable.text = [NSString stringWithFormat:@"    %@   ",model.task_source_text];
//}
@end
