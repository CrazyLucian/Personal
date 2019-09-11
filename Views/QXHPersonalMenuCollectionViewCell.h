//
//  QXHPersonalMenuCollectionViewCell.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHPersonalMenuCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnImage;

- (void)bindValueWithName:(NSString*)name imageName:(NSString*)imageName edge:(CGFloat)edge;
@end

NS_ASSUME_NONNULL_END
