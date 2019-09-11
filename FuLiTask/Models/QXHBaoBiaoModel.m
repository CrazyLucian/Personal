//
//  QXHBaoBiaoModel.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/7/12.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHBaoBiaoModel.h"

@implementation QXHBaoBiaoModel
+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"OnTeam" : @"self",
             };
}
@end
