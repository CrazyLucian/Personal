//
//  QXHAssociatedAccountTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/14.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAssociatedAccountTableViewCell.h"
@interface QXHAssociatedAccountTableViewCell()<UITextFieldDelegate>

@end
@implementation QXHAssociatedAccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.viewInput.layer.borderColor = [UIColor qmui_colorWithHexString:@"e9e9e9"].CGColor;
    self.viewInput.layer.borderWidth = 1;
    // Initialization code
}
- (IBAction)switchAction:(id)sender {
    
//    if (self.cellSwitch.on == NO) {
//        self.returnSwitchBlock(100);
//    }else{
//        self.returnSwitchBlock(50);
//    }
    
}
- (IBAction)switchButtonAction:(id)sender {
    if (self.btnSwitch.selected == NO) {
        self.returnSwitchBlock(100);
    }else{
        self.returnSwitchBlock(50);
    }
}

-(void)refreshCellWithState:(BOOL)state model:(nonnull QXHUserInfoModel *)model row:(NSInteger)row{
    self.btnSwitch.selected = state;
    self.viewInput.hidden = !state;
    if (row == 0) {
        if (model.qq.length > 0) {
            self.btnSwitch.enabled = NO;
            [self.btnSwitch setImage:[UIImage imageNamed:@"switch_on"] forState:UIControlStateNormal];
            self.txtId.text = model.qq;
            self.txtId.enabled = NO;
        }
    }else{
        if (model.wechat.length > 0) {
            self.btnSwitch.enabled = NO;
            [self.btnSwitch setImage:[UIImage imageNamed:@"switch_on"] forState:UIControlStateNormal];
            self.txtId.text = model.wechat;

            self.txtId.enabled = NO;
        }
    }
}
- (IBAction)confirmAction:(id)sender {
    [self.txtId resignFirstResponder];
    self.returnconfirmBlock(self.txtId.text);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
