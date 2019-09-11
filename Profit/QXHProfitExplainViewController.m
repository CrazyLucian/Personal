//
//  QXHProfitExplainViewController.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/12.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHProfitExplainViewController.h"
#import <WebKit/WebKit.h>
@interface QXHProfitExplainViewController ()<UIWebViewDelegate,WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>
@property (strong, nonatomic) WKWebView *htmlWebView;
@end

@implementation QXHProfitExplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//        self.titleView.title = @"我的收益";
    [self setUpWebView];
    // Do any additional setup after loading the view.
}
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUpWebView{
    
    CGFloat height = 64;
    if (kDevice_Is_iPhoneX) {
        height = 88;
    }
    
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"f5f5f5"];
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor qmui_colorWithHexString:@"EA452E"];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    //        self.navigationItem.titleView = topView;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, topView.frame.size.height - 30, 100, 20);
    
    if (self.type == 0) {
        label.text = @"收益说明";
    }else{
        label.text = @"隐私条例";
    }
    
    [topView addSubview:label];
    
    UIButton *btnBack = [[UIButton alloc] init];
    btnBack.frame = CGRectMake(0, height - 44, 44, 44);
    [btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnBack];
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btnBack);
        make.centerX.equalTo(topView);
    }];
    
    [self.view addSubview:topView];
    
    NSString *jScript = [NSString stringWithFormat:@"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=%f'); document.getElementsByTagName('head')[0].appendChild(meta);",SCREEN_WIDTH];
    
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];
    
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = wkUController;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, height, SCREEN_WIDTH, SCREEN_HEIGHT - height) configuration:wkWebConfig];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    self.htmlWebView = webView;
    
    if (self.type == 0) {
        [self.htmlWebView loadHTMLString:@"收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明收益说明" baseURL:nil];
    }else{
        [self.htmlWebView loadHTMLString:@"隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例隐私条例" baseURL:nil];
    }
    [self.view addSubview:self.htmlWebView];
}

#pragma mark - WKNavigationDelegate  // （按触发顺序排列）

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    //    NSLog(@"发送请求前决定是否跳转======%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //    NSLog(@"开始加载======%@",self.webView.URL.absoluteString);
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    //    NSLog(@"收到响应，决定是否跳转======%@",navigationResponse.response.URL.absoluteString);
    
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    //    NSLog(@"内容开始返回======%@",self.webView.URL.absoluteString);
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    //    NSLog(@"页面加载完成======%@",self.webView.URL.absoluteString);
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
}

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    //    NSLog(@"接收到服务器跳转请求======%@",webView.URL.absoluteString);
}
#pragma mark - WKScriptMessageHandler

// js调用oc方法  js代码格式：window.webkit.messageHandlers.方法名.postMessage({body: 'hello world!'});
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"方法名"]) {
        // 调用方法
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
