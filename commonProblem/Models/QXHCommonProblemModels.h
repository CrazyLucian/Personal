//
//  QXHCommonProblemModels.h
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/15.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHCommonProblemModels : NSObject

@end
@interface QXHProblemArrayModels : NSObject
@property (nonatomic, copy) NSString *typeID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, copy) NSString *weigh;

@end
NS_ASSUME_NONNULL_END
