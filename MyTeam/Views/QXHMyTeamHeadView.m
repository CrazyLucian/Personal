//
//  QXHMyTeamHeadView.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamHeadView.h"
@interface QXHMyTeamHeadView()
//四个白色的view
@property (nonatomic, strong) UIView *leftBackView;
@property (nonatomic, strong) UIView *centerBackView;
@property (nonatomic, strong) UIView *rightBackView;
@property (nonatomic, strong) UIView *bottomBackView;
@property (nonatomic, strong) UIButton *leftBackButton;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *telephonecBackView;

@property (nonatomic, strong) UILabel *yongHuNameLable;
@property (nonatomic, strong) UILabel *telephonecLable;
@property (nonatomic, strong) UILabel *timeLable;
@end
@implementation QXHMyTeamHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeUpSubViews];
    }
    return self;
}
-(void)makeUpSubViews{

    [self.bigBackView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.left.equalTo(0);
    }];
    
    [self.leftBackButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(30);
        make.left.equalTo(12);
        make.top.equalTo(30);
    }];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bigBackView.mas_centerX);
        make.top.equalTo(31);
    }];
    [self.numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLable.mas_bottom).offset(37);
    }];
    [self.numberDetailsLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.numberLable.mas_bottom).offset(5);
    }];
    [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(70);
        make.left.equalTo(25);
        make.top.equalTo(150);
    }];
    [self.NameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(3);
        make.centerY.equalTo(self.headImageView.mas_centerY);
    }];
    [self.leftBackView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(110);
        make.height.equalTo(84);
        make.left.equalTo(15);
        make.top.equalTo(self.bigBackView.mas_bottom).offset(20);
    }];
    [self.centerBackView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(110);
        make.height.equalTo(84);
        make.top.equalTo(self.leftBackView.mas_top);
        make.left.equalTo(self.leftBackView.mas_right).offset(8);
    }];
    [self.rightBackView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(110);
        make.height.equalTo(84);
        make.top.equalTo(self.leftBackView.mas_top);
        make.right.equalTo(-15);
    }];
    [self.bottomBackView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.top.equalTo(self.centerBackView.mas_bottom).offset(8);
        make.height.equalTo(84);
    }];
    /*@property (nonatomic, strong) UILabel *puTongLable;
     @property (nonatomic, strong) UILabel *puTongDetailLable;
     @property (nonatomic, strong) UILabel *vipLable;
     @property (nonatomic, strong) UILabel *vipDetailLable;
     @property (nonatomic, strong) UILabel *daiLiLable;
     @property (nonatomic, strong) UILabel *daiLiDetailLable;
     @property (nonatomic, strong) UILabel *zhiShuHuiYuanLable;
     @property (nonatomic, strong) UILabel *hiShuHuiYuanDetailLable;
     @property (nonatomic, strong) UILabel *zhiShuXiaJiLable;
     @property (nonatomic, strong) UILabel *zhiShuXiaJiDetailLable;
     */
    [self.puTongLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(23);
    }];
    [self.puTongDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(self.puTongLable.mas_bottom).offset(14);
    }];
    
    
    [self.vipLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(23);
    }];
    [self.vipDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(self.vipLable.mas_bottom).offset(14);
    }];
    
    [self.daiLiLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(23);
    }];
    [self.daiLiDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(self.daiLiLable.mas_bottom).offset(14);
    }];
    
    [self.zhiShuHuiYuanLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(61);
        make.top.equalTo(24);
    }];
    [self.hiShuHuiYuanDetailLable makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.zhiShuHuiYuanLable.mas_centerX);
        make.top.equalTo(self.zhiShuHuiYuanLable.mas_bottom).offset(14);
    }];
    
    
    [self.zhiShuXiaJiLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-61);
        make.top.equalTo(24);
    }];
    [self.zhiShuXiaJiDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.zhiShuXiaJiLable.mas_centerX);
        make.top.equalTo(self.zhiShuXiaJiLable.mas_bottom).offset(14);
    }];
    
    [self.telephonecBackView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.height.equalTo(33);
        make.top.equalTo(self.bottomBackView.mas_bottom).offset(17);
    }];
    
    [self.telephonecBackView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.height.equalTo(33);
        make.top.equalTo(self.bottomBackView.mas_bottom).offset(17);
    }];
    
    [self.yongHuNameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(42);
        make.top.equalTo(11);
    }];
    
    [self.telephonecLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(182);
        make.top.equalTo(11);
    }];
    
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-10);
        make.top.equalTo(11);
    }];
}
-(UIImageView *)bigBackView{
    if(!_bigBackView){
        _bigBackView = [[UIImageView alloc]init];
        [_bigBackView setUserInteractionEnabled:YES];
        _bigBackView.image = [UIImage imageNamed:@"yxyRedBack"];
        [self addSubview:_bigBackView];
    }
    return _bigBackView;
}
-(UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc]init];
        _numberLable.text = @"188";
        _numberLable.font = [UIFont systemFontOfSize:39];
        _numberLable.textColor  = RGBCOLOR(255, 255, 255);
        [self.bigBackView addSubview:_numberLable];
    }
    return _numberLable;
}
-(UILabel *)numberDetailsLable{
    if (!_numberDetailsLable) {
        _numberDetailsLable = [[UILabel alloc]init];
        _numberDetailsLable.text = @"团队人数";
        _numberDetailsLable.font = [UIFont systemFontOfSize:12];
        _numberDetailsLable.textColor  = RGBCOLOR(255, 255, 255);
        [self.bigBackView addSubview:_numberDetailsLable];
    }
    return _numberDetailsLable;
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 35;
        _headImageView.image = [UIImage imageNamed:@"色阶 661 拷贝"];
        [self.bigBackView addSubview:_headImageView];
    }
    return _headImageView;
}
-(UILabel *)NameLable{
    if (!_NameLable) {
        _NameLable = [[UILabel alloc]init];
        _NameLable.text = @"余潇逸";
        _NameLable.font = [UIFont systemFontOfSize:17];
        _NameLable.textColor  = RGBCOLOR(255, 255, 255);
        [self.bigBackView addSubview:_NameLable];
    }
    return _NameLable;
}
-(UIView *)leftBackView{
    if (!_leftBackView) {
        _leftBackView = [[UIView alloc]init];
        _leftBackView.backgroundColor = [UIColor whiteColor];
        _leftBackView.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:84/255.0 blue:84/255.0 alpha:0.06].CGColor;
        _leftBackView.layer.shadowOffset = CGSizeMake(6,4);
        _leftBackView.layer.shadowOpacity = 1;
        _leftBackView.layer.shadowRadius = 14;
        _leftBackView.layer.cornerRadius = 5;
        [self addSubview:_leftBackView];
    }
    return _leftBackView;
}
-(UIView *)rightBackView{
    if (!_rightBackView) {
        _rightBackView = [[UIView alloc]init];
        _rightBackView.backgroundColor = [UIColor whiteColor];
        _rightBackView.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:84/255.0 blue:84/255.0 alpha:0.06].CGColor;
        _rightBackView.layer.shadowOffset = CGSizeMake(6,4);
        _rightBackView.layer.shadowOpacity = 1;
        _rightBackView.layer.shadowRadius = 14;
        _rightBackView.layer.cornerRadius = 5;
        [self addSubview:_rightBackView];
    }
    return _rightBackView;
}
-(UIView *)centerBackView{
    if (!_centerBackView) {
        _centerBackView = [[UIView alloc]init];
        _centerBackView.backgroundColor = [UIColor whiteColor];
        _centerBackView.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:84/255.0 blue:84/255.0 alpha:0.06].CGColor;
        _centerBackView.layer.shadowOffset = CGSizeMake(6,4);
        _centerBackView.layer.shadowOpacity = 1;
        _centerBackView.layer.shadowRadius = 14;
        _centerBackView.layer.cornerRadius = 5;
         [self addSubview:_centerBackView];
    }
    return _centerBackView;
}
-(UIView *)bottomBackView{
    if (!_bottomBackView) {
        _bottomBackView = [[UIView alloc]init];
        _bottomBackView.backgroundColor = [UIColor whiteColor];
        _bottomBackView.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:84/255.0 blue:84/255.0 alpha:0.06].CGColor;
        _bottomBackView.layer.shadowOffset = CGSizeMake(6,4);
        _bottomBackView.layer.shadowOpacity = 1;
        _bottomBackView.layer.shadowRadius = 14;
        _bottomBackView.layer.cornerRadius = 5;
        [self addSubview:_bottomBackView];
    }
    return _bottomBackView;
}
-(UIButton *)leftBackButton{
    if (!_leftBackButton) {
        _leftBackButton = [[UIButton alloc]init];
        [_leftBackButton setImage:[UIImage imageNamed:@"leftBackButton"] forState:UIControlStateNormal];
        [_leftBackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
        [self.bigBackView addSubview:_leftBackButton];
    }
    return _leftBackButton;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"我的团队";
        _titleLable.font = [UIFont systemFontOfSize:18];
        _titleLable.textColor  = RGBCOLOR(255, 255, 255);
        [self.bigBackView addSubview:_titleLable];
    }
    return _titleLable;
}
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }return nil;
    
}
-(void)backView{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}


-(UILabel *)puTongLable{
    if (!_puTongLable) {
        _puTongLable = [[UILabel alloc]init];
        _puTongLable.text = @"普通会员人数";
        _puTongLable.font = [UIFont systemFontOfSize:12];
        _puTongLable.textColor  = RGBCOLOR(136, 136, 136);
        [self.leftBackView addSubview:_puTongLable];
    }
    return _puTongLable;
}
-(UILabel *)puTongDetailLable{
    if (!_puTongDetailLable) {
        _puTongDetailLable = [[UILabel alloc]init];
        _puTongDetailLable.text = @"100人";
        _puTongDetailLable.font = [UIFont systemFontOfSize:14];
        _puTongDetailLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.leftBackView addSubview:_puTongDetailLable];
    }
    return _puTongDetailLable;
}


-(UILabel *)vipLable{
    if (!_vipLable) {
        _vipLable = [[UILabel alloc]init];
        _vipLable.text = @"VIP会员人数";
        _vipLable.font = [UIFont systemFontOfSize:12];
        _vipLable.textColor  = RGBCOLOR(136, 136, 136);
        [self.centerBackView addSubview:_vipLable];
    }
    return _vipLable;
}
-(UILabel *)vipDetailLable{
    if (!_vipDetailLable) {
        _vipDetailLable = [[UILabel alloc]init];
        _vipDetailLable.text = @"100人";
        _vipDetailLable.font = [UIFont systemFontOfSize:14];
        _vipDetailLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.centerBackView addSubview:_vipDetailLable];
    }
    return _vipDetailLable;
}

-(UILabel *)daiLiLable{
    if (!_daiLiLable) {
        _daiLiLable = [[UILabel alloc]init];
        _daiLiLable.text = @"代理商人数";
        _daiLiLable.font = [UIFont systemFontOfSize:12];
        _daiLiLable.textColor  = RGBCOLOR(136, 136, 136);
        [self.rightBackView addSubview:_daiLiLable];
    }
    return _daiLiLable;
}
-(UILabel *)daiLiDetailLable{
    if (!_daiLiDetailLable) {
        _daiLiDetailLable = [[UILabel alloc]init];
        _daiLiDetailLable.text = @"100人";
        _daiLiDetailLable.font = [UIFont systemFontOfSize:14];
        _daiLiDetailLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.rightBackView addSubview:_daiLiDetailLable];
    }
    return _daiLiDetailLable;
}


-(UILabel *)zhiShuHuiYuanLable{
    if (!_zhiShuHuiYuanLable) {
        _zhiShuHuiYuanLable = [[UILabel alloc]init];
        _zhiShuHuiYuanLable.text = @"直属会员人数";
        _zhiShuHuiYuanLable.font = [UIFont systemFontOfSize:12];
        _zhiShuHuiYuanLable.textColor  = RGBCOLOR(136, 136, 136);
        [self.bottomBackView addSubview:_zhiShuHuiYuanLable];
    }
    return _zhiShuHuiYuanLable;
}
-(UILabel *)hiShuHuiYuanDetailLable{
    if (!_hiShuHuiYuanDetailLable) {
        _hiShuHuiYuanDetailLable = [[UILabel alloc]init];
        _hiShuHuiYuanDetailLable.text = @"100人";
        _hiShuHuiYuanDetailLable.font = [UIFont systemFontOfSize:14];
        _hiShuHuiYuanDetailLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.bottomBackView addSubview:_hiShuHuiYuanDetailLable];
    }
    return _hiShuHuiYuanDetailLable;
}

-(UILabel *)zhiShuXiaJiLable{
    if (!_zhiShuXiaJiLable) {
        _zhiShuXiaJiLable = [[UILabel alloc]init];
        _zhiShuXiaJiLable.text = @"直属会员下级";
        _zhiShuXiaJiLable.font = [UIFont systemFontOfSize:12];
        _zhiShuXiaJiLable.textColor  = RGBCOLOR(136, 136, 136);
        [self.bottomBackView addSubview:_zhiShuXiaJiLable];
    }
    return _zhiShuXiaJiLable;
}
-(UILabel *)zhiShuXiaJiDetailLable{
    if (!_zhiShuXiaJiDetailLable) {
        _zhiShuXiaJiDetailLable = [[UILabel alloc]init];
        _zhiShuXiaJiDetailLable.text = @"100人";
        _zhiShuXiaJiDetailLable.font = [UIFont systemFontOfSize:14];
        _zhiShuXiaJiDetailLable.textColor  = RGBCOLOR(51, 51, 51);
        [self.bottomBackView addSubview:_zhiShuXiaJiDetailLable];
    }
    return _zhiShuXiaJiDetailLable;
}

-(UIView *)telephonecBackView{
    if (!_telephonecBackView) {
        _telephonecBackView = [[UIView alloc]init];
        _telephonecBackView.backgroundColor = RGBCOLOR(250, 250, 250);
        [self addSubview:_telephonecBackView];
    }
    return _telephonecBackView;
}

-(UILabel *)yongHuNameLable{
    if (!_yongHuNameLable) {
        _yongHuNameLable = [[UILabel alloc]init];
        _yongHuNameLable.text = @"用户名";
        _yongHuNameLable.font = [UIFont systemFontOfSize:12];
        _yongHuNameLable.textColor  = RGBCOLOR(102, 102, 102);
        [self.telephonecBackView addSubview:_yongHuNameLable];
    }
    return _yongHuNameLable;
}

-(UILabel *)telephonecLable{
    if (!_telephonecLable) {
        _telephonecLable = [[UILabel alloc]init];
        _telephonecLable.text = @"手机号码";
        _telephonecLable.font = [UIFont systemFontOfSize:12];
        _telephonecLable.textColor  = RGBCOLOR(102, 102, 102);
        [self.telephonecBackView addSubview:_telephonecLable];
    }
    return _telephonecLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"注册时间";
        _timeLable.font = [UIFont systemFontOfSize:12];
        _timeLable.textColor  = RGBCOLOR(102, 102, 102);
        [self.telephonecBackView addSubview:_timeLable];
    }
    return _timeLable;
}
-(void)configUIWithModel:(QXHMyTeamNumberModels *)model{
    self.numberLable.text = model.total_num;
    self.puTongDetailLable.text = model.ordinary_num;
    self.vipDetailLable.text = model.vip_num;
    self.daiLiDetailLable.text = model.agent_num;
    self.hiShuHuiYuanDetailLable.text = model.one_num;
    self.zhiShuXiaJiDetailLable.text = model.two_num;
}
@end
