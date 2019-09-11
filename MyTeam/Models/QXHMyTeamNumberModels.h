//
//  QXHMyTeamNumberModels.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/21.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHMyTeamNumberModels : NSObject
@property (nonatomic, copy) NSString *total_num;
@property (nonatomic, copy) NSString *ordinary_num;
@property (nonatomic, copy) NSString *vip_num;
@property (nonatomic, copy) NSString *agent_num;
@property (nonatomic, copy) NSString *one_num;
@property (nonatomic, copy) NSString *two_num;
@end



@interface QXHMyTeamNumberContentModels : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickname;
//是否是VIP  1普通 2vip
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *create_time_text;

@end
NS_ASSUME_NONNULL_END
