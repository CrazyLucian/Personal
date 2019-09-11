//
//  QXHTestTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHTestTableViewCell.h"
#import "QXHPersonalMenuCollectionViewCell.h"
@implementation QXHTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 5;
    self.backView.clipsToBounds = YES;
    [self.contentView addSubview:self.backView];
    
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
    }];

    self.labelNames = @[@"收益",@"订单",@"卡券",@"团队",@"福利任务",@"邀请"];
    [self.backView addSubview:self.collectionView];
    // Initialization code
}
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.contentView.backgroundColor = [UIColor whiteColor];
//        self.backView = [[UIView alloc] init];
//        self.backView.backgroundColor = [UIColor whiteColor];
//        self.backView.layer.cornerRadius = 5;
//        self.backView.clipsToBounds = YES;
//        [self.contentView addSubview:self.backView];
//
//        [self.backView makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
//        }];
//
//
//
//
//        self.labelNames = @[@"收益",@"订单",@"卡券",@"团队",@"福利任务",@"邀请"];
//        [self.backView addSubview:self.collectionView];
//
//    }
//    return self;
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UICollectionView*)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-24)/3, 75);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 22;
        layout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-24, 150) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"QXHPersonalMenuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"QXHPersonalMenuCollectionView"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QXHPersonalMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QXHPersonalMenuCollectionView" forIndexPath:indexPath];
    [cell bindValueWithName:self.labelNames[indexPath.row] imageName:[NSString stringWithFormat:@"组%ld",indexPath.row+2]];
    
    
    
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    //    if ([self.delegate respondsToSelector:@selector(homeServiceCell:didClickServiceButtonAtIndex:)]) {
    //        [self.delegate homeServiceCell:self didClickServiceButtonAtIndex:indexPath.row];
    //    }
    
    
    
}

@end
