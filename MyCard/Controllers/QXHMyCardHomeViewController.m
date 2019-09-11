//
//  QXHMyCardHomeViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/17.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyCardHomeViewController.h"
#import "XXPageTabView.h"
#import "QXHMyCardAllViewController.h"

@interface QXHMyCardHomeViewController ()<XXPageTabViewDelegate>
@property (nonatomic, strong) XXPageTabView *pageTabView;
@end

@implementation QXHMyCardHomeViewController
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
    // 1.我的全部
    QXHMyCardAllViewController *title_0VC = [[QXHMyCardAllViewController alloc] init];
    title_0VC.type = @"0";
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.我的可使用
    QXHMyCardAllViewController *title_1VC = [[QXHMyCardAllViewController alloc] init];
     title_1VC.type = @"2";
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    // 1.我的已作废
    QXHMyCardAllViewController *title_2VC = [[QXHMyCardAllViewController alloc] init];
     title_2VC.type = @"3";
    title_0VC.view.backgroundColor = [UIColor whiteColor];
    
    // 2.我的待支付
    QXHMyCardAllViewController *title_3VC = [[QXHMyCardAllViewController alloc] init];
    title_3VC.type = @"1";
    title_1VC.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_2VC];
    [self addChildViewController:title_3VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"全部", @"可使用",@"已作废", @"待支付"]];
    _pageTabView.frame = CGRectMake(0, 0, kScreen_WIDTH, kScreen_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 44);
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
