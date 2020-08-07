//
//  WebViewController.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WebViewController.h"
//#import <WebKit/WebKit.h>

//状态栏高度
#define StatusHeight [UIApplication sharedApplication].statusBarFrame.size.height
//导航栏高度
#define NaviHeight (StatusHeight + 44)

#define SafeAreaBottomHeight (StatusHeight == 44 ? 34 : 0)
//标签栏高度
#define TabBarHeight (SafeAreaBottomHeight + 49)

@interface WebViewController ()

@property(nonatomic, strong) UIWebView *webView;

@end

@implementation WebViewController

- (instancetype)init {
    if (self == [super init]) {
        [self.view addSubview:self.webView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)configureWithDeepLink:(DPLDeepLink *)deepLink {
    //正常字典参数
    NSString *urlString = deepLink[@"url"];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (UIWebView *)webView {
    
    if (!_webView) {
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, NaviHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - SafeAreaBottomHeight - NaviHeight)];
        _webView.backgroundColor = [UIColor whiteColor];

        _webView.scrollView.showsHorizontalScrollIndicator = YES;
        _webView.scrollView.showsVerticalScrollIndicator = YES;
    }
    return _webView;
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
