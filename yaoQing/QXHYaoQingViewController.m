//
//  QXHYaoQingViewController.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHYaoQingViewController.h"
#import "QXHYaoQingImageCell.h"
//邀请记录
#import "QXHYaoQingjILuViewController.h"
#import <UMShare/UMShare.h>
#import <UShareUI/UShareUI.h>
#import "ShareView.h"
#import "QXHYaoQingModels.h"

@interface QXHYaoQingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *goodsModels;
@end

@implementation QXHYaoQingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodsModels = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNaviGational];
    [self requsetHttp];
    [self.view addSubview:self.tableView];
    [self createShareButton];
    if (self.type == 1) {
        self.navigationController.navigationBarHidden = YES;
    }
}
-(void)requsetHttp{
    [PPHTTPRequest yaoQingMyFriends:nil success:^(Response *response) {
        NSLog(@"%@",[response mj_JSONString]);
        for (NSObject * onjc in response.body) {
         [self.goodsModels addObject:onjc];
            }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)createShareButton{
    UIView *BavkView = [[UIView alloc]init];
    BavkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BavkView];
    [BavkView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.height.equalTo(66);
    }];
    UIButton *shareButton = [[UIButton alloc]init];
    [shareButton setTitle:@"去分享" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareButton.backgroundColor = RGBCOLOR(233, 46, 21);
    shareButton.layer.shadowColor =  [UIColor colorWithRed:233/255.0 green:46/255.0 blue:21/255.0 alpha:0.48].CGColor;
    shareButton.layer.shadowOffset = CGSizeMake(0, 1);
    shareButton.layer.shadowOpacity = 1;
    shareButton.layer.shadowRadius = 10;
    shareButton.layer.cornerRadius = 20.3;
     [shareButton addTarget:self action:@selector(shareButton) forControlEvents:UIControlEventTouchUpInside];
    [BavkView addSubview:shareButton];
    [shareButton makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(BavkView);
        make.width.equalTo(309);
        make.height.equalTo(41);
    }];
}
-(void)shareButton{
    [self shareBoardBySelfDefined];
}
- (void)shareBoardBySelfDefined {
    
 
//
//    BOOL hadInstalledWeixin = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]];
//    BOOL hadInstalledQQ = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
    
    NSMutableArray *titlearr     = [NSMutableArray arrayWithCapacity:5];
    NSMutableArray *imageArr     = [NSMutableArray arrayWithCapacity:5];
    NSMutableArray *typeArr     = [NSMutableArray arrayWithCapacity:5];
    [titlearr addObjectsFromArray:@[@"微信", @"微信朋友圈",@"微信收藏"]];
    [imageArr addObjectsFromArray:@[@"wechat",@"friend",@"umshare_favorite"]];
    [typeArr addObjectsFromArray:@[@(ShareTypeWechatSession), @(ShareTypeWechatTimeLine),@(ShareTypeWechatFavorite)]];

    ShareView *shareView = [[ShareView alloc] initWithShareHeadOprationWith:titlearr andImageArry:imageArr andProTitle:@"分享到"];
    [shareView setBtnClick:^(NSInteger btnTag) {
        NSLog(@"\n点击第几个====%d\n当前选中的按钮title====%@",(int)btnTag,titlearr[btnTag]);
        [self shareToPlatform:[typeArr[btnTag] integerValue]];
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:shareView];
}
- (void)shareToPlatform:(ShareType)type {
    //显示分享面板
    __weak typeof(self) weakSelf = self;
    switch (type) {
        case ShareTypeWechatSession:
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
            break;
        case ShareTypeWechatTimeLine:
//            NSLog(@"分享至朋友圈");
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            break;
        case ShareTypeWechatFavorite:
            //            NSLog(@"分享微信收藏");
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_WechatFavorite];
            break;
        case ShareTypeQQ:
            NSLog(@"分享至QQ");
            break;
        case ShareTypeQZone:
            NSLog(@"分享至QQ空间");
            break;
        case ShareTypeSina:
            NSLog(@"分享至微博");
            break;
        default:
            break;
    }
}
//网页分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType {
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"hahahahh" descr:@"分享内容描述" thumImage:[UIImage imageNamed:@"yaoQingHaoYou"]];
    //设置网页地址
    shareObject.webpageUrl = self.goodsModels[0];
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

- (void)alertWithError:(NSError *)error {
    
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"分享成功"];
    }
    else{
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n",(int)error.code];
        }
        else{
            result = [NSString stringWithFormat:@"分享失败"];
        }
        // result = [NSString stringWithFormat:@"分享失败"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"干啥"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    
    [alert show];
}
-(void)createNaviGational{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor clearColor];
    topView.layer.shadowColor = [UIColor colorWithRed:115/255.0 green:115/255.0 blue:115/255.0 alpha:0.08].CGColor;
    topView.layer.shadowOffset = CGSizeMake(1,1);
    topView.layer.shadowOpacity = 1;
    topView.layer.shadowRadius = 4;
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"邀请好友";
    [topView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(btnBack.mas_centerY);
    }];
   
    
    UIButton *jiLuButton = [[UIButton alloc] init];
    [jiLuButton setTitle:@"邀请记录" forState:UIControlStateNormal];
    [jiLuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    jiLuButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [jiLuButton addTarget:self action:@selector(goToJliView) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:jiLuButton];
    [jiLuButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(54);
        make.height.equalTo(12);
        make.right.equalTo(-15);
        make.centerY.equalTo(label.mas_centerY);
    }];
     [self.view addSubview:topView];
}
-(void)goToJliView{
    QXHYaoQingjILuViewController *vc = [[QXHYaoQingjILuViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)
                      style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[QXHYaoQingImageCell class] forCellReuseIdentifier:@"QXHYaoQingImageCell"];
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1000;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QXHYaoQingImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QXHYaoQingImageCell"];
    [cell configUIWithModel:self.goodsModels];
    cell.backgroundColor  = [UIColor clearColor];
    return cell;
}
@end

