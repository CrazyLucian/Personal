//
//  QXHCheckInModel.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/21.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHCheckInModel : NSObject
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSDictionary *remark;
@property (nonatomic, copy) NSString *create_time;

@end

@interface QXHCheckNewModel : NSObject
@property (nonatomic, copy) NSString *total;
@property (nonatomic) BOOL is_sign_in;

@end

NS_ASSUME_NONNULL_END
