//
//  QXHPersonalMenuTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalMenuTableViewCell.h"
#import "QXHPersonalMenuCollectionViewCell.h"
@implementation QXHPersonalMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor clearColor];
            self.backView = [[UIView alloc] init];
            self.backView.backgroundColor = [UIColor whiteColor];
            self.backView.layer.cornerRadius = 5;
            self.backView.clipsToBounds = YES;
            [self.contentView addSubview:self.backView];
    self.backView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24, 160);
//            [self.backView makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
//            }];




            self.labelNames = @[@"收益",@"订单",@"卡券",@"团队",@"福利任务",@"邀请"];
            [self.backView addSubview:self.collectionView];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
- (UICollectionView*)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.itemSize = CGSizeMake(84, 75);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = (SCREEN_WIDTH - 84 * 3 - 24) / 2;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-24, 160) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"QXHPersonalMenuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"QXHPersonalMenuCollectionView"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QXHPersonalMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QXHPersonalMenuCollectionView" forIndexPath:indexPath];
    NSArray *imageArr = @[@"收益",@"订单",@"coupon_personal",@"团队",@"福利任务",@"邀请"];
    [cell bindValueWithName:self.labelNames[indexPath.row + indexPath.section * 3] imageName: imageArr[indexPath.row + indexPath.section * 3] edge:0.1f];
    
    
    
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if ([_delegate respondsToSelector:@selector(QXHPersonalMenuTableViewCell:clickButton:)]) {
        
        [_delegate QXHPersonalMenuTableViewCell:self clickButton:indexPath.item + indexPath.section * 3];
        
    }
    
    
    
}

@end
