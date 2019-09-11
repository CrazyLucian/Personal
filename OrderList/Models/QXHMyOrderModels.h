//
//  QXHMyOrderModels.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/24.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyOrderModels : NSObject
@property (nonatomic, copy) NSString *order_no;
@property (nonatomic, copy) NSString *goods_title;
@property (nonatomic, copy) NSString *goods_image;
@property (nonatomic, copy) NSString *goods_num;
@property (nonatomic) float price;
@property (nonatomic) float return_commission;
@property (nonatomic, copy) NSString *is_settlement;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickname;
//nickname
@end

NS_ASSUME_NONNULL_END
