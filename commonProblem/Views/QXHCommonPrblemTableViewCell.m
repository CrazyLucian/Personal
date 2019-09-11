//
//  QXHCommonPrblemTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCommonPrblemTableViewCell.h"
#import "QXHCommonNextViewController.h"
#import "QXHCommonProblemModels.h"
@interface QXHCommonPrblemTableViewCell()
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *verticalLineView;
@property (nonatomic, strong) UIView *centerLineView;
@property (nonatomic, strong) UIButton *nextButton;
@end
@implementation QXHCommonPrblemTableViewCell
- (void)congigUIWithArray:(NSArray *)array{
    if (array.count > 0) {
        QXHProblemArrayModels *model = [QXHProblemArrayModels mj_objectWithKeyValues:array[0]];
        self.firstLable.text = model.title;
    }else{
        self.firstLable.text = @"";
    }
    
    if (array.count > 1) {
        QXHProblemArrayModels *model = [QXHProblemArrayModels mj_objectWithKeyValues:array[1]];
        self.secondLable.text = model.title;
    }else{
        self.secondLable.text = @"";
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)setupUI{
    [self.topLineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(11);
        make.right.equalTo(-14);
        make.height.equalTo(1);
        make.top.equalTo(-0.5);
    }];
    [self.bottomLineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(11);
        make.right.equalTo(-14);
        make.height.equalTo(1);
        make.bottom.equalTo(0.5);
    }];
    [self.iconHeadImage makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(16);
        make.left.equalTo(48);
        make.top.equalTo(12);
    }];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconHeadImage.mas_centerX);
        make.top.equalTo(self.iconHeadImage.mas_bottom).offset(16);
    }];
    [self.nextButton  makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.nameLable.mas_centerX);
        make.top.equalTo(self.nameLable.mas_bottom).offset(10);
        make.width.equalTo(11);
        make.height.equalTo(7);
    }];
    [self.verticalLineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLineView.mas_bottom);
        make.bottom.equalTo(self.bottomLineView.mas_top);
        make.width.equalTo(1);
        make.left.equalTo(115);
    }];
    [self.centerLineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verticalLineView.mas_right);
        make.right.equalTo(-18);
        make.centerY.equalTo(self.verticalLineView.mas_centerY);
        make.height.equalTo(1);
    }];
    [self.firstLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(16);
        make.left.equalTo(self.verticalLineView.mas_right).offset(14);
    }];
    [self.secondLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerLineView.mas_bottom).offset(12);
        make.left.equalTo(self.verticalLineView.mas_right).offset(14);
    }];
    
}
-(UIImageView *)iconHeadImage{
    if (!_iconHeadImage) {
        _iconHeadImage = [[UIImageView alloc]init];
        _iconHeadImage.image = [UIImage imageNamed:@"huiyuan"];
        [self addSubview:_iconHeadImage];
    }
    return _iconHeadImage;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"其他问题";
        _nameLable.textColor = RGBCOLOR(34, 34, 36);
        _nameLable.font = [UIFont systemFontOfSize:11];
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
-(UILabel *)firstLable{
    if (!_firstLable) {
        _firstLable = [[UILabel alloc]init];
        _firstLable.text = @"怎么分享优惠券？";
        _firstLable.textColor = RGBCOLOR(85, 85, 85);
        _firstLable.font = [UIFont systemFontOfSize:14];
        [self addSubview:_firstLable];
    }
    return _firstLable;
}
-(UILabel *)secondLable{
    if (!_secondLable) {
        _secondLable = [[UILabel alloc]init];
        _secondLable.text = @"怎么邀请注册？";
        _secondLable.textColor = RGBCOLOR(85, 85, 85);
        _secondLable.font = [UIFont systemFontOfSize:14];
        [self addSubview:_secondLable];
    }
    return _secondLable;
}
-(UIView *)topLineView{
    if (!_topLineView) {
        _topLineView = [[UIView alloc]init];
        _topLineView.backgroundColor = RGBCOLOR(245, 245, 249);
        [self addSubview:_topLineView];
    }
    return _topLineView;
}
-(UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = RGBCOLOR(245, 245, 249);
        [self addSubview:_bottomLineView];
    }
    return _bottomLineView;
}
-(UIView *)verticalLineView{
    if (!_verticalLineView) {
        _verticalLineView = [[UIView alloc]init];
        _verticalLineView.backgroundColor = RGBCOLOR(245, 245, 249);
        [self addSubview:_verticalLineView];
    }
    return _verticalLineView;
}
-(UIView *)centerLineView{
    if (!_centerLineView) {
        _centerLineView = [[UIView alloc]init];
        _centerLineView.backgroundColor = RGBCOLOR(245, 245, 249);
        [self addSubview:_centerLineView];
    }
    return _centerLineView;
}
-(UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [[UIButton alloc]init];
        [_nextButton setImage:[UIImage imageNamed:@"箭头(4)拷贝2"] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(netVc)  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nextButton];
    }
    return _nextButton;
}
-(void)netVc{
    QXHCommonNextViewController *vc = [[QXHCommonNextViewController alloc]init];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }return nil;
    
}
@end
