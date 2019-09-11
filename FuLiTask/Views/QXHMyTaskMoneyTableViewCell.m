//
//  QXHMyTaskMoneyTableViewCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHMyTaskMoneyTableViewCell.h"
#import "QXHMyTaskCollectionCell.h"
#import "QXHMyTaskJinDuTiaoCell.h"
@interface QXHMyTaskMoneyTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *nameArr;
@property (nonatomic, strong) NSArray *leftArray;
@property (nonatomic, strong) NSDictionary *moneyDictionary;
@end
@implementation QXHMyTaskMoneyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.dataArr = @[@"yxyYellowBack",@"yxyBlueBack",@"pinkBack",@"redback"];
        self.nameArr = @[@"闲乐任务",@"疯狂淘金",@"海量悬赏",@"应用试客",@"赚多多"];
          self.leftArray = @[@"yxyXian",@"yxyTao",@"yxyShang",@"yxyZhuan"];
        self.moneyDictionary = [[NSDictionary alloc]init];
        [self.contentView addSubview:self.collectionView];
//        [self.contentView addSubview:self.tableView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setupUI{
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(10);
    }];
//    [self.collectionView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.nameLable.mas_bottom).offset(11);
//    }];
}
- (UICollectionView*)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(124, 88);
        // 水平滚动
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.sectionInset = UIEdgeInsetsMake(0,0,0,0);
        CGRect rect = CGRectMake(0, 30, SCREEN_WIDTH, 88);
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        [_collectionView registerClass:[QXHMyTaskCollectionCell class] forCellWithReuseIdentifier:@"QXHMyTaskCollectionCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        /// 设置此属性为yes 不满一屏幕 也能滚动
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QXHMyTaskCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QXHMyTaskCollectionCell" forIndexPath:indexPath];
    NSString *index = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    NSString *money = [NSString stringWithFormat:@"%@",self.moneyDictionary[@"money"][index]];
    cell.moneyLable.text = money;
    cell.bigImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.dataArr[indexPath.row]]];
    cell.nameLabel.text = self.nameArr[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.leftArray[indexPath.row]]];
    return cell;
}
-(UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
        _nameLable.text = @"我的任务收益";
        _nameLable.textColor = RGBCOLOR(51, 51, 51);
        _nameLable.font = [UIFont systemFontOfSize:14];
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
- (void)bindGoodsModel:(NSDictionary *)model{
    self.moneyDictionary = model;
    NSLog(@"%@",model[@"money"][@"1"]);
    [self.collectionView reloadData];
}
@end
