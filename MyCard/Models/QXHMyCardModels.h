//
//  QXHMyCardModels.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/9.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyCardModels : NSObject
/*
 
 "id": 101,
 "order_id": 679,
 "goods_id": 10000630,
 "title": "美团外卖-10元-卡密-自营",
 "image": "",
 "start_time": "2019-07-08",
 "expire_time": "2019-12-29",
 "price": 0,
 "sell_price": 0,
 "return_commission": 0,
 "status": 2,
 "status_text": "未使用"
 
 */

@property (nonatomic, copy) NSString *goods_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *expire_time;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *goodID;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *sell_price;
@end

NS_ASSUME_NONNULL_END
