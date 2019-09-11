//
//  QXHKuaiBaoContrentVC.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHKuaiBaoContrentVC.h"
#import "QXHKuaiBaoModels.h"

@interface QXHKuaiBaoContrentVC ()<UIWebViewDelegate>

@end

@implementation QXHKuaiBaoContrentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requsetHttp];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNaviGational];
    [self createUI];
}
-(void)requsetHttp{
    
    [PPHTTPRequest quXiangKuaiBaoWihtParameters:@{@"id":self.typeID} success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        QXHKuaiBaoDetailModels *model = [QXHKuaiBaoDetailModels mj_objectWithKeyValues:response.body];
        self.titleLable.text = model.title;
        self.timeLable.text = model.create_time;
        self.contentLable.text = model.content;
        [self.webView loadHTMLString:model.content baseURL:nil];
    } failure:^(NSError *error) {
        
    }];
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor clearColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"趣享快报";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    [self.view addSubview:topView];
    
    
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(23);
        make.top.equalTo(topView.mas_bottom).offset(27);
    }];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.mas_left);
        make.top.equalTo(self.titleLable.mas_bottom).offset(11);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(24);
        make.right.equalTo(-24);
        make.height.equalTo(1);
        make.top.equalTo(self.timeLable.mas_bottom).offset(15);
    }];
//    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(24);
//        make.right.equalTo(-24);
//        make.top.equalTo(self.lineView.mas_bottom).offset(19);
//    }];
    [self.webView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(24);
        make.right.equalTo(-24);
        make.width.equalTo(SCREEN_WIDTH - 48);
         make.top.equalTo(self.lineView.mas_bottom).offset(19);
        make.height.equalTo(SCREEN_HEIGHT - 80);
    }];
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createUI{

}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"系统通知";
        _titleLable.font = [UIFont systemFontOfSize:15];
        _titleLable.textColor = RGBCOLOR(51, 51, 51);
        [self.view addSubview:_titleLable];
    }
    return _titleLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.text = @"2019年3月3日  11:32";
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = RGBCOLOR(153, 153, 153);
        [self.view addSubview:_timeLable];
    }
    return _timeLable;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(231, 231, 231);
        [self.view addSubview:_lineView];
    }
    return _lineView;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @"这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介这里是内容简介";
        _contentLable.font = [UIFont systemFontOfSize:11];
        _contentLable.numberOfLines = 0;
        _contentLable.textColor = RGBCOLOR(153, 153, 153);
        [self.view addSubview:_contentLable];
    }
    return _contentLable;
}
-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_webView];
    }
    return _webView;
}
@end
