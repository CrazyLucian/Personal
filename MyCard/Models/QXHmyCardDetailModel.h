//
//  QXHmyCardDetailModel.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/9.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHmyCardDetailModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *expire_time;
@property (nonatomic, copy) NSString *card_number;
@property (nonatomic, copy) NSString *card_pwd;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *sell_price;
@property (nonatomic, copy) NSString *return_commission;
@property (nonatomic, copy) NSArray *rule;

@end

NS_ASSUME_NONNULL_END
