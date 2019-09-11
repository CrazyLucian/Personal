//
//  QXHCommonContentViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/25.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCommonContentViewController.h"
#import "QXHCommonProblemModels.h"

@interface QXHCommonContentViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation QXHCommonContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requsetHttp];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNaviGational];
    
    // Do any additional setup after loading the view.
}
-(void)requsetHttp{
    [PPHTTPRequest changJianWenTIDetailWihtParameters:@{@"id":self.typeID} success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        QXHProblemArrayModels *model = [QXHProblemArrayModels mj_objectWithKeyValues:response.body];
        self.titleLable.text = model.title;
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
    [topView az_setGradientBackgroundWithColors:@[RGBCOLOR(234, 69, 46 ),RGBCOLOR(234, 65, 72)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = @"常见问题";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    [self.view addSubview:topView];
    
    [self.titileIcon makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(15);
        make.top.equalTo(topView.mas_bottom).offset(20);
        make.left.equalTo(15);
    }];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titileIcon.mas_top);
        make.left.equalTo(self.titileIcon.mas_right).offset(15);
        make.right.equalTo(-15);
    }];
    
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(15);
        make.top.equalTo(self.titleLable.mas_bottom).offset(20);
        make.left.equalTo(15);
        
    }];
//    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top);
//        make.left.equalTo(self.contentView.mas_right).offset(15);
//        make.right.equalTo(-15);
//    }];
    [self.webView makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.contentView.mas_top).offset(-5);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(SCREEN_HEIGHT);
        make.left.equalTo(self.contentView.mas_right).offset(15);
         make.right.equalTo(-15);
    }];
    
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIImageView *)titileIcon{
    if (!_titileIcon) {
        _titileIcon = [[UIImageView alloc]init];
        _titileIcon.image = [UIImage imageNamed:@"公告"];
        [self.view addSubview:_titileIcon];
    }
    return _titileIcon;
}
-(UIImageView *)contentView{
    if (!_contentView) {
        _contentView = [[UIImageView alloc]init];
        _contentView.image = [UIImage imageNamed:@"公告"];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告";
        _titleLable.font = AppFont(13);
        _titleLable.numberOfLines = 0;
        _titleLable.textColor = [UIColor blackColor];
        [self.view addSubview:_titleLable];
    }
    return _titleLable;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @"公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告";
        _contentLable.font = AppFont(13);
        _contentLable.numberOfLines = 0;
        _contentLable.textColor = [UIColor blackColor];
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
