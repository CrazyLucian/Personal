//
//  QXHPersonalHeaderView.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalHeaderView.h"
//会员中心
#import "QXHFirstVIPCenterViewController.h"

@implementation QXHPersonalHeaderView
-(void)initViewWithModel:(QXHUserInfoModel *)model{

        [self.imageHeader sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"色阶 661"]];
//    [self.imageHeader sd_setImageWithURL:[NSURL URLWithString:@"http://quxh.oss-cn-hangzhou.aliyuncs.com/app-uploads/2068-12-19%2005:01:31/110940.png"] placeholderImage:nil];
    self.labelName.text = model.nickname;
    CGSize size = [model.nickname sizeWithFont:[UIFont systemFontOfSize:17] constrainedToWidth:SCREEN_WIDTH - 70 - 68 - 75 - 5];
    CGRect rectName = self.labelName.frame;
    rectName.size.width = size.width + 5;
    self.labelName.frame = rectName;
    
    CGRect rectVip = self.btnVip.frame;
    rectVip.origin.x = rectName.origin.x + rectName.size.width;
    self.btnVip.frame = rectVip;
 
    switch ([model.level integerValue]) {
        case 1:
            [self.btnVip setTitle:@"普通会员" forState:UIControlStateNormal];
            break;
        case 2:
            [self.btnVip setTitle:@"高级会员" forState:UIControlStateNormal];
            break;
        case 3:
            [self.btnVip setTitle:@"代理商" forState:UIControlStateNormal];
            break;
        case 4:
            [self.btnVip setTitle:@"联合创始人" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    self.labelInviteCode.text = [NSString stringWithFormat:@"邀请码：%@",model.invite_code];
    self.labelBalance.text = [NSString stringWithFormat:@"￥%@",model.balance];
    
//    if ([model.level integerValue] == 4) {
//        self.btnQuota.hidden = NO;
//        [self.btnQuota setTitle:[NSString stringWithFormat:@"剩余额度：%@",model.surplus_quota] forState:UIControlStateNormal];
//    }else{
//        self.btnQuota.hidden = YES;
//    }
}
-(void)refreshProfirData:(QXHIncomeModel *)model{
    self.labelThisMonth.text = model.benyue_yugu;
    self.labelToday.text = model.all_shouyi;
    self.labelLastMonth.text = [NSString stringWithFormat:@"上月结算￥%@",model.shangyue_jiesuan];
    self.labelYestoday.text = [NSString stringWithFormat:@"昨日预估￥%@",model.zuori_yugu];
    NSMutableAttributedString * noteStr1 = [[NSMutableAttributedString alloc]initWithString:self.labelLastMonth.text];
    //    NSRange redRangeTwo = ;
    [noteStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor qmui_colorWithHexString:@"D3AF8D"] range:NSMakeRange(4, self.labelLastMonth.text.length - 4)];
    self.labelLastMonth.attributedText = noteStr1;
    
    NSMutableAttributedString * noteStr2 = [[NSMutableAttributedString alloc]initWithString:self.labelYestoday.text];
    //    NSRange redRangeTwo = ;
    [noteStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor qmui_colorWithHexString:@"D3AF8D"] range:NSMakeRange(4, self.labelYestoday.text.length - 4)];
    self.labelYestoday.attributedText = noteStr2;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"QXHPersonalHeaderView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    self.imageHeader.layer.cornerRadius = 27.f;
    self.viewBottom.layer.masksToBounds = YES;
    self.viewBottom.layer.cornerRadius = 4.f;
    self.btnSignIn.layer.masksToBounds = YES;
    self.btnSignIn.layer.cornerRadius = 14.f;
    self.btnCopy.layer.masksToBounds = YES;
    self.btnCopy.layer.cornerRadius = 8.f;
    self.btnWithdraw.layer.masksToBounds = YES;
    self.btnWithdraw.layer.cornerRadius = 6.f;
    self.btnVip.layer.masksToBounds = YES;
    self.btnVip.layer.cornerRadius = 8.f;
    
    
    
    
    
    return self;
}
- (IBAction)messageAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:3];
    }

}
- (IBAction)vipButtonClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:2];
    }
}

- (IBAction)settingAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:4];
    }
}
- (IBAction)copyAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:5];
    }
}
- (IBAction)queryQuota:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:6];
    }
}
- (IBAction)signInAction:(id)sender {
    NSLog(@"点击签到了");
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:7];
    }
 
}
- (IBAction)withdrawAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:8];
    }
}
- (IBAction)skipToIncome:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:9];
    }
}
- (IBAction)skipToPersonalInfoVC:(id)sender {
    if ([_delegate respondsToSelector:@selector(personalHeaderView:clickButton:)]) {
        [_delegate personalHeaderView:self clickButton:1];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
