//
//  QXHFuLiAllViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHFuLiAllViewController.h"
#import "XXPageTabView.h"
//我的福利
#import "QXHFuLiMyViewController.h"
//我的团队福利
#import "QXHMyTeamFuLiAllViewController.h"
#import "QXHLncomeListViewController.h"
#import "QXHFuLiMyAllViewController.h"
#import "QXHFuLiTeamViewController.h"

@interface QXHFuLiAllViewController ()<XXPageTabViewDelegate>
@property (nonatomic, strong) XXPageTabView *pageTabView;
@end

@implementation QXHFuLiAllViewController

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
    view.userInteractionEnabled = YES;
    
   
    [self.view addSubview:view];
}
-(void)goToShouRu:(UIButton *)button{
    //跳转收入报表
    QXHLncomeListViewController *vc = [[QXHLncomeListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 初始化segmentType_0View
- (void)setupSegmentType_0View {
    // 1.我的
    QXHFuLiMyAllViewController *title_0VC = [[QXHFuLiMyAllViewController alloc] init];
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.团队
    QXHFuLiTeamViewController *title_1VC = [[QXHFuLiTeamViewController alloc] init];
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"我的", @"团队"]];
    [_pageTabView setUserInteractionEnabled:YES];
    UIButton *jiLuButton = [[UIButton alloc] init];
    [jiLuButton setTitle:@"收入报表" forState:UIControlStateNormal];
    [jiLuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    jiLuButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [jiLuButton addTarget:self action:@selector(goToShouRu:) forControlEvents:UIControlEventTouchUpInside];
    [_pageTabView addSubview:jiLuButton];
    [jiLuButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(54);
        make.height.equalTo(12);
        make.right.equalTo(-15);
        //        make.centerY.equalTo(view.mas_centerY);
        make.top.equalTo(17);
    }];
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
