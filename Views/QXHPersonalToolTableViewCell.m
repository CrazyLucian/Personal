//
//  QXHPersonalToolTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalToolTableViewCell.h"
#import "QXHPersonalMenuCollectionViewCell.h"
//常见问题
#import "QXHcommonProblemViewController.h"
//新手教程
#import "QXHUserGuideViewController.h"

@implementation QXHPersonalToolTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 5;
    self.backView.clipsToBounds = YES;
    [self.contentView addSubview:self.backView];
    
    self.cellTitleLabel = [[UILabel alloc] init];
    self.cellTitleLabel.text = @"实用工具";
    self.cellTitleLabel.textColor = [UIColor qmui_colorWithHexString:@"333333"];
    self.cellTitleLabel.frame = CGRectMake(30, 10, 100, 20);
    [self.contentView addSubview:self.cellTitleLabel];
    
    self.lineLabel = [[UILabel alloc] init];
    
    self.lineLabel.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    self.lineLabel.frame = CGRectMake(12, 36, SCREEN_WIDTH - 24, 1);
    [self.contentView addSubview:self.lineLabel];
        self.backView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24, 134);
//    [self.backView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
//    }];
    
    
    
    
    self.labelNames = @[@"新手教程",@"地堆资料",@"商学院",@"常见问题"];
    [self.backView addSubview:self.collectionView];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UICollectionView*)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-24)/4, 65);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 47, SCREEN_WIDTH-24, 65) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"QXHPersonalMenuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"QXHPersonalMenuCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QXHPersonalMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QXHPersonalMenuCollectionViewCell" forIndexPath:indexPath];

    NSArray *imageArr = @[@"新手帮助(1)",@"资料",@"学院配置",@"常见问题"];
    [cell bindValueWithName:self.labelNames[indexPath.row] imageName: imageArr[indexPath.row] edge:20.f];
    
    
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
//        if ([self.delegate respondsToSelector:@selector(homeServiceCell:didClickServiceButtonAtIndex:)]) {
//            [self.delegate homeServiceCell:self didClickServiceButtonAtIndex:indexPath.row];
//        }
    if (indexPath.row == 3) {
        QXHcommonProblemViewController *vc = [[QXHcommonProblemViewController alloc]init];
        //常见问题
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if ( indexPath.row == 0){
        //新手教程
        QXHUserGuideViewController *vc = [[QXHUserGuideViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }return nil;
    
}
@end
