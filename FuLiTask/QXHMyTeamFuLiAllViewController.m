//
//  QXHMyTeamFuLiAllViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/20.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTeamFuLiAllViewController.h"
#import "XXPageTabView.h"
#import "QXHFuLiTeamViewController.h"

@interface QXHMyTeamFuLiAllViewController ()<XXPageTabViewDelegate>
@property (nonatomic, strong) XXPageTabView *pageTabView;
@end

@implementation QXHMyTeamFuLiAllViewController

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
    
    UIButton * leftBackButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 32, 30, 30)];
    [leftBackButton setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [leftBackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftBackButton];
    
    
}
-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 初始化segmentType_0View
- (void)setupSegmentType_0View {
    // 1.我的团队未提交
    QXHFuLiTeamViewController *title_0VC = [[QXHFuLiTeamViewController alloc] init];
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.我的团队 审核中
    QXHFuLiTeamViewController *title_1VC = [[QXHFuLiTeamViewController alloc] init];
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    // 1.我的团队 已通过
    QXHFuLiTeamViewController *title_2VC = [[QXHFuLiTeamViewController alloc] init];
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.我的团队 未通过
    QXHFuLiTeamViewController *title_3VC = [[QXHFuLiTeamViewController alloc] init];
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_2VC];
    [self addChildViewController:title_3VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"未提交", @"审核中",@"已通过", @"未通过"]];
    _pageTabView.frame = CGRectMake(0, 15, kScreen_WIDTH, kScreen_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 37);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = RGBCOLOR(51, 51, 51);
    _pageTabView.selectedColor = RGBCOLOR(233, 46, 21);
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
}
#pragma mark - XXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);
    
    switch (selectedTabIndex) {
        case 0:
        {
            // 全部n
            NSLog(@"我的全部");
        }
            break;
        case 1:
        {
            // 可使用
            NSLog(@"我的可使用");
        }
            break;
        case 2:
        {
            //
            NSLog(@"我的已经作废");
            
        }
            break;
        case 3:
        {
            NSLog(@"待支付");
        }
            break;
    }
}
@end
