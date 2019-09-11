//
//  QXHWithdrawSuccessView.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/19.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHWithdrawSuccessView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger time;

-(instancetype)initView;

-(void)remove;
@end

NS_ASSUME_NONNULL_END
