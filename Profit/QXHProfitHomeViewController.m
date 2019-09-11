//
//  QXHProfitHomeViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/12.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHProfitHomeViewController.h"
#import "QXHProfitViewController.h"
#import "QXHProfitExplainViewController.h"
#import "QXHPersonalModel.h"
@interface QXHProfitHomeViewController ()<UIScrollViewDelegate>
//@property (nonatomic, strong) UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (nonatomic, strong) UILabel *labelProfit;
@property (nonatomic, strong) UILabel *labelBalance;
@property (nonatomic, strong) UILabel *labelSlider;
@property (nonatomic, strong) NSMutableArray *btnsArray;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) QXHProfitViewController *firstVC;
@property (nonatomic, strong) QXHProfitViewController *secondVC;
@property (nonatomic, strong) QXHProfitViewController *thirdVC;
@property (nonatomic, strong) QXHProfitViewController *fourthVC;
@property (nonatomic, strong) QXHProfitViewController *fifthVC;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation QXHProfitHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.titleView.title = @"我的收益";
//    UIView *topView = [[UIView alloc] init];
//    topView.backgroundColor = [UIColor clearColor];
//    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
//    self.navigationItem.titleView = topView;
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.textColor = [UIColor whiteColor];
//    label.frame = CGRectMake(0, topView.frame.size.height - 20, 100, 20);
//    label.text = @"我的收益";
//    [topView addSubview:label];
//    
//    UIButton *btnBack = [[UIButton alloc] init];
//    btnBack.frame = CGRectMake(0, 20, 44, 44);
//    [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
//    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
//    [topView addSubview:btnBack];
    
    [self createView];
    
    [QXHPUTRequest getMyProfitWithParameters:nil success:^(Response *response) {
        if (response.code == 1) {
            QXHIncomeModel *model = [QXHIncomeModel mj_objectWithKeyValues:response.body];
            NSLog(@"%@",[model mj_JSONString]);
            _labelProfit.text = [NSString stringWithFormat:@"￥%@",model.all_amount];
//            _labelBalance.text = [NSString stringWithFormat:@"账户余额：%@",model.balance];
            NSArray *list = response.body[@"list"];
            self.dataArr = [[NSMutableArray alloc] init];
            for (int i = 0; i < list.count; i ++) {
                QXHIncomeDetailModel *model = [QXHIncomeDetailModel mj_objectWithKeyValues:list[i]];
                [self.dataArr addObject:model];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadIncomeDataNotification" object:nil userInfo:@{@"array":self.dataArr}];
            
        }
    } failure:^(NSError *error) {
        
    }];
//    [self.view addSubview:topView];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)questionAction:(UIButton *)button{
    QXHProfitExplainViewController *VC = [[QXHProfitExplainViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)backAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

-(QXHProfitViewController *)firstVC{
    if (!_firstVC) {
        _firstVC = [[QXHProfitViewController alloc] init];
        _firstVC.type = 0;
    }
    return _firstVC;
}
-(QXHProfitViewController *)secondVC{
    if (!_secondVC) {
        _secondVC = [[QXHProfitViewController alloc] init];
        _secondVC.type = 1;
    }
    return _secondVC;
}
-(QXHProfitViewController *)thirdVC{
    if (!_thirdVC) {
        _thirdVC = [[QXHProfitViewController alloc] init];
        _thirdVC.type = 2;
    }
    return _thirdVC;
}
-(QXHProfitViewController *)fourthVC{
    if (!_fourthVC) {
        _fourthVC = [[QXHProfitViewController alloc] init];
        _fourthVC.type = 3;
    }
    return _fourthVC;
}
-(QXHProfitViewController *)fifthVC{
    if (!_fifthVC) {
        _fifthVC = [[QXHProfitViewController alloc] init];
        _fifthVC.type = 4;
    }
    return _fifthVC;
}
-(void)createView{
//    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 241)];
//    
//    [self.view addSubview:_backgroundView];

    UIView *topView = [[UIView alloc] init];
        topView.backgroundColor = [UIColor clearColor];
        topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        self.navigationItem.titleView = topView;
    
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, topView.frame.size.height - 20, 100, 20);
        label.text = @"我的收益";
    
    label.textAlignment = NSTextAlignmentCenter;
        [topView addSubview:label];
    
    
        UIButton *btnBack = [[UIButton alloc] init];
        btnBack.frame = CGRectMake(0, 30, 44, 44);
        [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:btnBack];
    
    UIButton *btnQuestion = [[UIButton alloc] init];
    btnQuestion.frame = CGRectMake(SCREEN_WIDTH - 44, 30, 44, 44);
    [btnQuestion setImage:[UIImage imageNamed:@"常见问题(1)"] forState:UIControlStateNormal];
    [btnQuestion addTarget:self action:@selector(questionAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnQuestion];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 241)];
    imageView.image = [UIImage imageNamed:@"头"];
    
    _labelProfit = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 100, 100, 200, 20)];
    _labelProfit.text = @"￥0";
    _labelProfit.textAlignment = NSTextAlignmentCenter;
    _labelProfit.textColor = [UIColor whiteColor];
    
    UILabel *labelIntroduce = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 100, 130, 200, 20)];
    labelIntroduce.text = @"累计收益结算";
    labelIntroduce.textAlignment = NSTextAlignmentCenter;
    labelIntroduce.textColor = [UIColor whiteColor];
    
    _labelBalance = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 100, 160, 200, 20)];
//    _labelBalance.text = @"账户余额(元)：￥0";
    _labelBalance.textAlignment = NSTextAlignmentCenter;
    _labelBalance.textColor = [UIColor whiteColor];
    [_backgroundView addSubview:imageView];
    [_backgroundView addSubview:_labelProfit];
    [_backgroundView addSubview:labelIntroduce];
    [_backgroundView addSubview:_labelBalance];
    [_backgroundView addSubview:topView];
    
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _backgroundView.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _backgroundView.frame.size.height)];
    _mainScrollView.delegate = self;
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_mainScrollView];
    
    
    NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
    
    QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
    if ([model.level integerValue] == 4) {
        
        NSArray *views = @[self.firstVC.view,self.secondVC.view,self.thirdVC.view,self.fourthVC.view,self.fifthVC.view];
        for (NSInteger i = 0; i<self.btnsArray.count; i++) {
            //把三个vc的view依次贴到_mainScrollView上面
            UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height-100)];
            [pageView addSubview:views[i]];
            [_mainScrollView addSubview:pageView];
        }
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*(views.count), 0);
    }else{
        NSArray *views = @[self.firstVC.view,self.secondVC.view,self.thirdVC.view,self.fourthVC.view];
        for (NSInteger i = 0; i<self.btnsArray.count; i++) {
            //把三个vc的view依次贴到_mainScrollView上面
            UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height-100)];
            [pageView addSubview:views[i]];
            [_mainScrollView addSubview:pageView];
        }
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*(views.count), 0);
    }
    
}
- (NSMutableArray *)btnsArray {
    if (!_btnsArray) {
        _btnsArray = [NSMutableArray array];
        NSDictionary *userInfo = [QXHUserDefaults readUserDefaultObjectValueForKey:USER_INFO];
        
        QXHUserInfoModel *model = [QXHUserInfoModel mj_objectWithKeyValues:userInfo];
        NSArray *dataArr = @[@"购物收益",@"充值收益",@"赚钱收益",@"推荐收益",@"管理津贴"];
        NSMutableArray *titleArr = [[NSMutableArray alloc] initWithArray:dataArr];
        if (!([model.level integerValue] == 4)) {
            
            [titleArr removeLastObject];
        }
        _labelSlider = [[UILabel alloc]initWithFrame:CGRectMake(0, _backgroundView.frame.size.height - 44, SCREEN_WIDTH/titleArr.count, 44)];
        _labelSlider.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        
        [_backgroundView addSubview:_labelSlider];
        
        
        for (int i = 0; i < titleArr.count; i++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor clearColor];
            btn.frame = CGRectMake(i*SCREEN_WIDTH/titleArr.count,_backgroundView.frame.size.height - 44, SCREEN_WIDTH/titleArr.count, 44);
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            [btn addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:titleArr[i] forState:UIControlStateNormal];
            btn.tag = i;
            [_btnsArray addObject:btn];
            [_backgroundView addSubview:btn];
        }
    }
    return _btnsArray;
}
/**
 *  标签按钮点击
 *
 *  @param sender 按钮
 */
-(void)sliderAction:(UIButton *)sender{
    [self sliderAnimationWithTag:sender.tag];
    [UIView animateWithDuration:0.3 animations:^{
        self.mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(sender.tag), 0);
    } completion:^(BOOL finished) {
        
    }];
}
/**
 *  滑动scrollView以及改变sliderLabel位置
 *
 *  @param tag 按钮tag
 */
-(void)sliderAnimationWithTag:(NSInteger)tag{
    [self.btnsArray enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        btn.selected = NO;
    }];
    //获取被选中的按钮
    UIButton *selectedBtn = self.btnsArray[tag];
    selectedBtn.selected = YES;
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        self.labelSlider.center = CGPointMake(selectedBtn.center.x, self.labelSlider.center.y);
    } completion:^(BOOL finished) {
        [self.btnsArray enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        }];
//        selectedBtn.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double index_ = scrollView.contentOffset.x/SCREEN_WIDTH;
    [self sliderAnimationWithTag:(int)(index_+0.5)];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
