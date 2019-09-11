//
//  QXHMyQuotaHeaderView.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/7/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXHPersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QXHMyQuotaHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *labelSurplus;
@property (weak, nonatomic) IBOutlet UILabel *labelAllQuota;
-(void)loadViewDataWithModel:(QXHQuotaModel *)model;
@end

NS_ASSUME_NONNULL_END
