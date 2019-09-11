//
//  QXHInComeHeadCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHInComeHeadCell.h"
#import "QXHDongJieShouRuViewController.h"
@interface QXHInComeHeadCell()
//收入money
@property (nonatomic, strong) UILabel *zhuanNameLable;
//冻结money
@property (nonatomic, strong) UILabel *dongNameLable;
@property (nonatomic, strong) UIView *heightView;
@end
@implementation QXHInComeHeadCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setupUI{
    [self.yellowView  makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.top.equalTo(6);
        make.right.equalTo(-12);
        make.height.equalTo(172);
    }];
    [self.zhuanNameLable  makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(32);
        make.left.equalTo(80);
    }];
    [self.zhuanLable  makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.zhuanNameLable.mas_centerX);
        make.top.equalTo(72);
    }];
    [self.dongNameLable  makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-80);
        make.top.equalTo(32);
    }];
    [self.dongJieiLable  makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(-45);
        make.centerX.equalTo(self.dongNameLable.mas_centerX);
        make.centerY.equalTo(self.zhuanLable.mas_centerY);
    }];
    [self.heightView  makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.yellowView.mas_centerX);
        make.height.equalTo(60);
        make.width.equalTo(1);
        make.top.equalTo(34);
    }];
}
-(UIImageView *)yellowView{
    if (!_yellowView) {
        _yellowView = [[UIImageView alloc]init];
        [_yellowView setUserInteractionEnabled:YES];
        _yellowView.image = [UIImage imageNamed:@"yxyYelllowView"];
        [self addSubview:_yellowView];
    }
    return _yellowView;
}
-(UILabel *)zhuanNameLable{
    if (!_zhuanNameLable) {
        _zhuanNameLable = [[UILabel alloc]init];
        _zhuanNameLable.text = @"赚取收入";
        _zhuanNameLable.font = [UIFont systemFontOfSize:14];
        _zhuanNameLable.textColor = RGBCOLOR(255, 255, 255);
        [self.yellowView addSubview:_zhuanNameLable];
    }
    return _zhuanNameLable;
}
-(UILabel *)zhuanLable{
    if (!_zhuanLable) {
        _zhuanLable = [[UILabel alloc]init];
        _zhuanLable.text = @"6688.00";
        _zhuanLable.font = [UIFont systemFontOfSize:29];
        _zhuanLable.textColor = RGBCOLOR(255, 255, 255);
        [self.yellowView addSubview:_zhuanLable];
    }
    return _zhuanLable;
}
-(UILabel *)dongNameLable{
    if (!_dongNameLable) {
        _dongNameLable = [[UILabel alloc]init];
        _dongNameLable.text = @"冻结收入";
        _dongNameLable.font = [UIFont systemFontOfSize:14];
        _dongNameLable.textColor = RGBCOLOR(255, 255, 255);
        [self.yellowView addSubview:_dongNameLable];
    }
    return _dongNameLable;
}
-(UIButton *)dongJieiLable{
    if (!_dongJieiLable) {
        _dongJieiLable = [[UIButton alloc]init];
        [_dongJieiLable setTitle:@"0.0" forState:UIControlStateNormal];
        _dongJieiLable.titleLabel.font = [UIFont systemFontOfSize:29];
        [_dongJieiLable setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
        [_dongJieiLable addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [self.yellowView addSubview:_dongJieiLable];
    }
    return _dongJieiLable;
}
-(UIView *)heightView{
    if (!_heightView) {
        _heightView = [[UIView alloc]init];
        _heightView.backgroundColor = [UIColor whiteColor];
        [self.yellowView addSubview:_heightView];
    }
    return _heightView;
}
-(void)cancelAction{
    QXHDongJieShouRuViewController *vc = [[QXHDongJieShouRuViewController alloc]init];
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
