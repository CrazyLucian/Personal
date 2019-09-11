//
//  QXHYaoQingHeadView.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHYaoQingHeadView.h"
@interface QXHYaoQingHeadView()
@property (nonatomic, strong) UIView *backWhiteView;
@property (nonatomic, strong) UILabel *topLabe;
@property (nonatomic, strong) UILabel *leftLabe;
@property (nonatomic, strong) UILabel *rightLabe;
@property (nonatomic, strong) UIView *backBlackView;
@property (nonatomic, strong) UILabel *yaoQingLable;
@end
@implementation QXHYaoQingHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeUpSubViews];
    }
    return self;
}

-(void)makeUpSubViews{
    
[self.backWhiteView makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(0);
    make.top.equalTo(0);
    make.height.equalTo(243);
}];
[self.topLabe makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.backWhiteView.mas_centerX);
    make.top.equalTo(20);
}];
[self.allMoney makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.backWhiteView.mas_centerX);
    make.top.equalTo(self.topLabe.mas_bottom).offset(25);
}];
[self.leftLabe makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.allMoney.mas_bottom).offset(34);
    make.left.equalTo(53);
}];
[self.todayPerson makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.leftLabe.mas_centerX);
    make.top.equalTo(self.leftLabe.mas_bottom).offset(15);
}];


[self.rightLabe makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.allMoney.mas_bottom).offset(34);
    make.right.equalTo(-53);
}];
[self.allPerson makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.rightLabe.mas_centerX);
    make.top.equalTo(self.rightLabe.mas_bottom).offset(15);
}];
    
    [self.backBlackView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(self.backWhiteView.mas_bottom);
        make.height.equalTo(42);
    }];
    [self.yaoQingLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backBlackView.mas_centerY);
        make.left.equalTo(15);
    }];
}
-(UIView *)backWhiteView{
    if (!_backWhiteView) {
        _backWhiteView = [[UIView alloc]init];
        _backWhiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backWhiteView];
    }
    return _backWhiteView;
}
-(UIView *)backBlackView{
    if (!_backBlackView) {
        _backBlackView = [[UIView alloc]init];
        _backBlackView.backgroundColor = RGBCOLOR(249, 249, 249);
        [self addSubview:_backBlackView];
    }
    return _backBlackView;
}
-(UILabel *)topLabe{
    if (!_topLabe) {
        _topLabe = [[UILabel alloc]init];
        _topLabe.text = @"邀请总收益";
        _topLabe.font =[UIFont fontWithName:@"Helvetica-Bold" size:14];//加粗
        _topLabe.textColor =RGBCOLOR(51, 51, 51);
        [self.backWhiteView addSubview:_topLabe];
    }
    return _topLabe;
}

-(UILabel *)yaoQingLable{
    if (!_yaoQingLable) {
        _yaoQingLable = [[UILabel alloc]init];
        _yaoQingLable.text = @"邀请详情";
        _yaoQingLable.font = [UIFont systemFontOfSize:12];
        _yaoQingLable.textColor =RGBCOLOR(136, 136, 136);
        [self.backBlackView addSubview:_yaoQingLable];
    }
    return _yaoQingLable;
}
-(UILabel *)allMoney{
    if (!_allMoney) {
        _allMoney = [[UILabel alloc]init];
        _allMoney.text = @"100";
        _allMoney.font = [UIFont systemFontOfSize:60];
        _allMoney.textColor =RGBCOLOR(255, 174, 0);
        [self.backWhiteView addSubview:_allMoney];
    }
    return _allMoney;
}
-(UILabel *)leftLabe{
    if (!_leftLabe) {
        _leftLabe = [[UILabel alloc]init];
        _leftLabe.text = @"今日邀请人数";
        _leftLabe.font = [UIFont systemFontOfSize:14];
        _leftLabe.textColor =RGBCOLOR(136, 136, 136);
        [self.backWhiteView addSubview:_leftLabe];
    }
    return _leftLabe;
}

-(UILabel *)todayPerson{
    if (!_todayPerson) {
        _todayPerson = [[UILabel alloc]init];
        _todayPerson.text = @"100";
        _todayPerson.font = [UIFont systemFontOfSize:28];
        _todayPerson.textColor =RGBCOLOR(50, 50, 50);
        [self.backWhiteView addSubview:_todayPerson];
    }
    return _todayPerson;
}

-(UILabel *)rightLabe{
    if (!_rightLabe) {
        _rightLabe = [[UILabel alloc]init];
        _rightLabe.text = @"总邀请人数";
        _rightLabe.font = [UIFont systemFontOfSize:14];
        _rightLabe.textColor =RGBCOLOR(136, 136, 136);
        [self.backWhiteView addSubview:_rightLabe];
    }
    return _rightLabe;
}

-(UILabel *)allPerson{
    if (!_allPerson) {
        _allPerson = [[UILabel alloc]init];
        _allPerson.text = @"100";
        _allPerson.font = [UIFont systemFontOfSize:28];
        _allPerson.textColor =RGBCOLOR(50, 50, 50);
        [self.backWhiteView addSubview:_allPerson];
    }
    return _allPerson;
}
@end
