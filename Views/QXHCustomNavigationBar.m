//
//  QXHCustomNavigationBar.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/12.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHCustomNavigationBar.h"

@implementation QXHCustomNavigationBar

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (kDevice_Is_iPhoneX) {
        NSArray *constraints = self.constraints;
        for (NSLayoutConstraint *constraint in constraints) {
            if (constraint.firstAttribute==NSLayoutAttributeHeight) {
                constraint.constant = 88;
            }
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
