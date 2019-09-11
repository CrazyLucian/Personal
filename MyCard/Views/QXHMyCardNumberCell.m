//
//  QXHMyCardNumberCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardNumberCell.h"
@interface QXHMyCardNumberCell ()
@property (nonatomic, strong) UIView *lineView;
@end
@implementation QXHMyCardNumberCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.cardName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(19);
    }];
    [self.cardNumber  makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(self.cardName.mas_bottom).offset(15);
    }];
    [self.fuButton  makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-15);
        make.width.equalTo(52);
        make.height.equalTo(20);
        make.top.equalTo(self.cardNumber.mas_top);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.bottom.equalTo(-1);
        make.height.equalTo(1);
    }];
}
-(UILabel *)cardName{
    if (!_cardName) {
        _cardName = [[UILabel alloc]init];
        _cardName.text = @"卡号";
        _cardName.font = [UIFont systemFontOfSize:14];
        _cardName.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_cardName];
    }
    return _cardName;
}
-(UILabel *)cardNumber{
    if (!_cardNumber) {
        _cardNumber = [[UILabel alloc]init];
        _cardNumber.text = @"EC8574837589473H";
        _cardNumber.font = [UIFont systemFontOfSize:14];
        _cardNumber.textColor  = RGBCOLOR(102, 102, 102);
        [self addSubview:_cardNumber];
    }
    return _cardNumber;
}
-(UIButton *)fuButton{
    if (!_fuButton) {
        _fuButton = [[UIButton alloc]init];
        [_fuButton setTitle:@"复制" forState:UIControlStateNormal];
        [_fuButton setTitleColor:RGBCOLOR(233 ,46,21) forState:UIControlStateNormal];
        _fuButton.titleLabel.font = AppFont(11);
        _fuButton.layer.borderWidth = 1;
        _fuButton.layer.borderColor = RGBCOLOR(233 ,46,21).CGColor;
        _fuButton.layer.masksToBounds  = YES;
        _fuButton.layer.cornerRadius = 5;
         [_fuButton addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_fuButton];
    }
    return _fuButton;
}
#pragma mark - 复制按钮的点击事件
- (void)clickLeftBtn {
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    [pab setString:self.cardNumber.text];
    if (pab == nil){
        [MBProgressHUD showError:@"复制失败" toView:[self viewController].view];
    }else{
        [MBProgressHUD showSuccess:@"复制成功" toView:[self viewController].view];
    }
}
-(UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(215, 215, 215);
        [self addSubview:_lineView];
    }
    return _lineView;
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
