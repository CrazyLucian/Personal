//
//  QXHCommonNextCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCommonNextCell.h"
@interface QXHCommonNextCell()
@property (nonatomic, strong) UIView *lineView;
@end
@implementation QXHCommonNextCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)setupUI{
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.nextImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(15);
        make.right.equalTo(-15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.height.equalTo(1);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"如果上个月没有体现，下个月可以一起提现吗？";
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textColor = RGBCOLOR(85, 85, 85);
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
-(UIImageView *)nextImageView{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc]init];
        _nextImageView.image = [UIImage imageNamed:@"huiyuan"];
        [self addSubview:_nextImageView];
    }
    return _nextImageView;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(238, 238, 238);
        [self addSubview:_lineView];
    }
    return _lineView;
}
- (void)bindGoodsModel:(QXHProblemArrayModels*)model{
    self.titleLable.text = model.title;
}
@end
