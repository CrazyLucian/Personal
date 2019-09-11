//
//  QXHPersonalModel.h
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/10.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QXHPacketRecordRemarkModel.h"


@interface QXHPersonalModel : NSObject
@property (nonatomic, copy) NSString *allowance;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *balance;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *invite_code;
@property (nonatomic, copy) NSString *is_bind_alipay;
@property (nonatomic, copy) NSString *is_bind_identity;
@property (nonatomic, copy) NSString *is_special;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *qq;
@property (nonatomic, copy) NSString *recharge;
@property (nonatomic, copy) NSString *red_packet;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *surplus_quota;
@property (nonatomic, copy) NSString *task;
@property (nonatomic, copy) NSString *wechat;

@end

@interface QXHIdentityModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *id_card;

@end

@interface QXHAlipayModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *account;

@end


@interface QXHPacketModel : NSObject

@property (nonatomic, copy) NSString *red_packet;
@property (nonatomic, copy) NSString *red_packet_surplus;
@property (nonatomic, copy) NSString *red_packet_freeze;
@property (nonatomic, copy) NSString *red_packets_transfer_rule;
@property (nonatomic, copy) NSString *red_packets_withdraw_rule;
@property (nonatomic, copy) NSString *max_prestore_money;
@property (nonatomic, copy) NSString *profit_ratio;
@property (nonatomic, copy) NSString *year;

@end

@interface QXHPacketRecordModel : NSObject

@property (nonatomic, copy) NSString *amount;
@property (nonatomic, strong) QXHPacketRecordRemarkModel *ramerk;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *balance;


@end

@interface QXHQuotaModel : NSObject

@property (nonatomic, copy) NSString *total_quota;
@property (nonatomic, strong) NSArray *faq;
@property (nonatomic, copy) NSString *surplus_quota;

@end

@interface QXHFaqModel : NSObject

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *answer;

@end

@interface QXHIncomeModel : NSObject

@property (nonatomic, copy) NSString *all_amount;
@property (nonatomic, copy) NSString *balance;

@property (nonatomic, copy) NSString *all_shouyi;
@property (nonatomic, copy) NSString *benyue_yugu;
@property (nonatomic, copy) NSString *shangyue_jiesuan;
@property (nonatomic, copy) NSString *zuori_yugu;


@end

@interface QXHIncomeDetailModel : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *yesterdayBs;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *yesterdayYg;
@property (nonatomic, copy) NSString *monthSy;
@property (nonatomic, copy) NSString *lastmonthSy;
@property (nonatomic, copy) NSString *monthYg;
@property (nonatomic, copy) NSString *lastmonthYg;
@property (nonatomic, copy) NSString *lastMonthJs;
@property (nonatomic, copy) NSString *todayBs;
@property (nonatomic, copy) NSString *todayYg;
@property (nonatomic, copy) NSString *todaySy;
@property (nonatomic, copy) NSString *yesterdaySy;

@end

@interface QXHConfigModel : NSObject

@property (nonatomic, copy) NSString *share_reward_rule;
@property (nonatomic, copy) NSString *withdraw_poundage;
@property (nonatomic, copy) NSString *coupon_rule;
@property (nonatomic, copy) NSString *frozen_instruction;
@property (nonatomic, copy) NSString *founder_invitation_description;
@property (nonatomic, copy) NSString *invitation_code_instruction;

@property (nonatomic, copy) NSString *yysk_task_illustration;
@property (nonatomic, copy) NSString *service_qq;
@property (nonatomic, copy) NSString *ranking_instruction;
@property (nonatomic, copy) NSString *registration_agreement_url;
@property (nonatomic, copy) NSString *privacy_rules_url;
@property (nonatomic, copy) NSString *audio_visual_rule;


@property (nonatomic, copy) NSString *app_download_explain;
@property (nonatomic, copy) NSString *withdraw_explain;
@property (nonatomic, copy) NSString *withdraw_success_tips;
@property (nonatomic, copy) NSString *recharge_vip;
@property (nonatomic, copy) NSString *recharge_founder;
@property (nonatomic, copy) NSString *recharge_agent;

@property (nonatomic, copy) NSString *agent_upgrade_need_vip;
@property (nonatomic, copy) NSString *reward_p_when_child_be_founder;
@property (nonatomic, copy) NSString *agent_upgrade_need_agent;
@property (nonatomic, copy) NSString *red_packets_withdraw_rule;
@property (nonatomic, copy) NSString *red_packets_transfer_rule;
@property (nonatomic, copy) NSString *coupon_notice_content;

@property (nonatomic, copy) NSString *coupon_notice_title;
@property (nonatomic, copy) NSString *jindong_withdraw_rule;
@property (nonatomic, copy) NSString *pdd_withdraw_rule;
@property (nonatomic, copy) NSString *taobao_withdraw_rule;
@end
