//
//  QXHWithdrawSuccessView.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHWithdrawSuccessView.h"

#define BASE_WIDTH 375.f
#define BASE_HEIGHT 667.f

//按比例计算的宽
#define UNIT_WIDTH(NSInteger) (double)NSInteger / BASE_WIDTH  * SCREEN_WIDTH
//按比例计算的高
#define UNIT_HEIGHT(NSInteger) (double)NSInteger / BASE_HEIGHT * SCREEN_HEIGHT

@interface QXHWithdrawSuccessView ()

@property (nonatomic, strong) UIView *shadowView;

@end


@implementation QXHWithdrawSuccessView


-(instancetype)initView{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    
    self.shadowView = [[UIView alloc] initWithFrame:self.frame];
    [self.shadowView setBackgroundColor:[UIColor clearColor]];
    [self.shadowView setAlpha:0.8];
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeShadowView)];
    [self.shadowView addGestureRecognizer:tap];
    [self addSubview:self.shadowView];
    
    //整个白色的view
    UIView *alertForClear = [[UIView alloc]init];
    alertForClear.layer.masksToBounds = YES;
    alertForClear.layer.cornerRadius = 4;
    alertForClear.backgroundColor = [UIColor whiteColor];
    [self addSubview:alertForClear];
    [alertForClear mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(23);
        make.right.equalTo(-23);
        make.height.equalTo(UNIT_WIDTH(387));
    }];
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"withdraw_success"];
    [alertForClear addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alertForClear.mas_centerX);
        make.top.equalTo(62);
        make.width.equalTo(158);
        make.height.equalTo(122);
    }];
    
    
    UIButton *CloseButton = [[UIButton alloc]init];
    [CloseButton setImage:[UIImage imageNamed:@"dongJieBack"] forState:UIControlStateNormal];
    [CloseButton addTarget:self action:@selector(btnForCick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:CloseButton];
    [CloseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(alertForClear.mas_bottom).with.offset(30);
        make.width.equalTo(38);
        make.height.equalTo(38);
        
    }];
    //标题
    UILabel *title =[[UILabel alloc]init];
    title.font = [UIFont systemFontOfSize:21];
    title.text = @"提现成功";
    title.textColor = RGBCOLOR(68, 68, 68);
    [title setTextAlignment:NSTextAlignmentCenter];
    [alertForClear addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(alertForClear.mas_centerX);
        make.top.equalTo(216);
        make.width.equalTo(158);
        make.height.equalTo(20);
    }];
    
    
    UILabel *labelExplain = [[UILabel alloc]init];
    labelExplain.text = @"提现金额将在1个工作日内到账";
    labelExplain.textColor = RGBCOLOR(136, 136, 136);
    labelExplain.font = [UIFont systemFontOfSize:14];
    [labelExplain setTextAlignment:NSTextAlignmentCenter];
    [alertForClear addSubview:labelExplain];
    [labelExplain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alertForClear.mas_centerX);
        make.top.equalTo(260);
        make.width.equalTo(300);
        make.height.equalTo(20);
    }];
    
    
    
    
    UIButton *doneButton =[[UIButton alloc]init];
    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton setTitleColor:RGBCOLOR(256, 256, 256) forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont systemFontOfSize:14];
    doneButton.backgroundColor = RGBCOLOR(236, 46, 21);
    [doneButton addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    [alertForClear addSubview:doneButton];
    [doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alertForClear.mas_centerX);
        make.top.equalTo(320);
        make.width.equalTo(300);
        make.height.equalTo(40);
    }];
    
}
-(void)remove{
    [self removeFromSuperview];
}
-(void)removeShadowView{
    [self removeFromSuperview];
}
-(void)btnForCick{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
