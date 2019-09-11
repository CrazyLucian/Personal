//
//  QXHPersonalModel.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHPersonalModel.h"

@implementation QXHPersonalModel

@end

@implementation QXHIdentityModel


@end

@implementation QXHAlipayModel


@end

@implementation QXHPacketModel


@end

@implementation QXHPacketRecordModel
-(instancetype)init{
    self = [super init];
    self.ramerk = [QXHPacketRecordRemarkModel new];
    return self;
}
@end

@implementation QXHQuotaModel


@end

@implementation QXHFaqModel

@end

@implementation QXHIncomeModel

@end

@implementation QXHIncomeDetailModel

@end

@implementation QXHConfigModel

@end
