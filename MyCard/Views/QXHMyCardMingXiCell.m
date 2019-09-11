//
//  QXHMyCardMingXiCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/18.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardMingXiCell.h"

@implementation QXHMyCardMingXiCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)makeUpSubViews{
    [self.leftView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(16);
        make.top.equalTo(30);
        make.width.equalTo(4);
        make.height.equalTo(15);
    }];
    [self.mingXinName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.mas_right).offset(6);
        make.centerY.equalTo(self.leftView.mas_centerY);
    }];
    [self.mingXinDatail makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftView.mas_bottom).offset(19);
        make.left.equalTo(17);
        make.right.equalTo(-17);
    }];
}
-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc]init];
        _leftView.backgroundColor =RGBCOLOR(233 ,46,21);
         [self addSubview:_leftView];
    }
    return _leftView;
}
-(UILabel *)mingXinName{
    if (!_mingXinName) {
        _mingXinName = [[UILabel alloc]init];
        _mingXinName.text = @"优惠细则";
        _mingXinName.font = [UIFont systemFontOfSize:12];
        _mingXinName.textColor  = RGBCOLOR(51, 51, 51);
        [self addSubview:_mingXinName];
    }
    return _mingXinName;
}
-(UILabel *)mingXinDatail{
    if (!_mingXinDatail) {
        _mingXinDatail = [[UILabel alloc]init];
        _mingXinDatail.text = @"1.这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明这里是规则说明";
        _mingXinDatail.font = [UIFont systemFontOfSize:12];
        _mingXinDatail.textColor  = RGBCOLOR(119, 119, 119);
        _mingXinDatail.numberOfLines = 0;
        [self addSubview:_mingXinDatail];
    }
    return _mingXinDatail;
}
-(void)configUIWithModel:(NSArray *)model{
    NSString *appendStr = @"";
    for (int i=0; i<model.count; i++) {
        appendStr = [appendStr stringByAppendingString:[NSString stringWithFormat:@"%d.%@\n", i + 1, model[i]]];
    }
    self.mingXinDatail.text = appendStr;
}
@end
