//
//  QXHKuaiBaoModels.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/15.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHKuaiBaoModels : NSObject
@property (nonatomic, copy) NSString *typeID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *is_show;
@property (nonatomic, copy) NSString *create_time;
@end
@interface QXHKuaiBaoDetailModels : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *create_time;
@end
NS_ASSUME_NONNULL_END
