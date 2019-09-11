//
//  QXHPersonalMenuTableViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QXHPersonalMenuTableViewCell;
@protocol QXHPersonalMenuCellDelegate <NSObject>

- (void)QXHPersonalMenuTableViewCell:(QXHPersonalMenuTableViewCell *)QXHPersonalMenuTableViewCell clickButton:(NSInteger)index;


@end

@interface QXHPersonalMenuTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) id<QXHPersonalMenuCellDelegate>delegate;

@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSArray *labelNames;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) UIView *backView;
@end

NS_ASSUME_NONNULL_END
