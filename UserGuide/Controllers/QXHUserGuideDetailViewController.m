//
//  QXHUserGuideDetailViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHUserGuideDetailViewController.h"

@interface QXHUserGuideDetailViewController ()
@property(nonatomic, strong) UIScrollView *ActivityScrollView;
@end

@implementation QXHUserGuideDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.ActivityScrollView];
//    [self addImageOnViewWithImage:self.imageName];
    [self createNaviGational];
}
#pragma mark - 初始化导航栏
-(void)createNaviGational{
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"操作指南";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
    [self.view addSubview:topView];
    
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIScrollView *)ActivityScrollView{
    if (!_ActivityScrollView) {
        _ActivityScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , SCREEN_HEIGHT)];
        //2.建立内容视图
        UIImage *image = [UIImage imageNamed:self.imageName];
        CGFloat imageH = image.size.height;
        NSLog(@"imageHimageHimageH%f",imageH);
        UIImageView * view = [[UIImageView alloc] initWithImage:image];
        view.frame = CGRectMake(0, 0,SCREEN_WIDTH,imageH/2);
        _ActivityScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, imageH/2);
        [_ActivityScrollView addSubview: view];
    }
    return _ActivityScrollView;
}
@end


