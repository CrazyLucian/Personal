//
//  QXHCardHomeViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCardHomeViewController.h"
#import "QXHMyCardHomeViewController.h"
#import "XXPageTabView.h"
#import "QXHMyTeamCardHomeViewController.h"

@interface QXHCardHomeViewController ()<XXPageTabViewDelegate>
@property (nonatomic, strong) XXPageTabView *pageTabView;

@end

@implementation QXHCardHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化导航栏
    [self setupNavBar];
    [self setupSegmentType_0View];
}
#pragma mark - 初始化导航栏
- (void)setupNavBar {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor  whiteColor];
    [self.view addSubview:view];
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
// 返回
- (void)returnBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 初始化segmentType_0View
- (void)setupSegmentType_0View {
    // 1.我的
    QXHMyCardHomeViewController *title_0VC = [[QXHMyCardHomeViewController alloc] init];
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.团队
    QXHMyTeamCardHomeViewController *title_1VC = [[QXHMyTeamCardHomeViewController alloc] init];
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"我的", @"团队"]];
    _pageTabView.frame = CGRectMake(0, 20, kScreen_WIDTH, kScreen_HEIGHT-20);
    _pageTabView.tabSize = CGSizeMake(130, 44);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = RGBCOLOR(51, 51, 51);
    _pageTabView.selectedColor = RGBCOLOR(233, 46, 21);
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
    
    UIButton * leftBackButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 32, 30, 30)];
    [leftBackButton setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [leftBackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBackButton];
    
}

#pragma mark - XXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);
    
    switch (selectedTabIndex) {
        case 0:
        {
            // 我的
        }
            break;
        case 1:
        {
            // 团队
        }
            break;
    }
}
@end

