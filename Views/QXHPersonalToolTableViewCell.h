//
//  QXHPersonalToolTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHPersonalToolTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *cellTitleLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSArray *labelNames;
@property (nonatomic, strong)UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
