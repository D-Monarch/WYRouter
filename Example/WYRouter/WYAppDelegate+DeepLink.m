//
//  WYAppDelegate+DeepLink.m
//  WYRouter_Example
//
//  Created by yao wang on 2020/8/4.
//  Copyright © 2020 htu_wang@163.com. All rights reserved.
//

#import "WYAppDelegate+DeepLink.h"

@implementation WYAppDelegate (DeepLink)


- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    
    // NSUserActivityTypeBrowsingWeb 由Universal Links唤醒的APP
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        [self handleOpenDeepLink:userActivity.webpageURL];
    }
    return YES;
}

- (BOOL)handleOpenDeepLink:(NSURL *)url {
    
   return [[WYRouter shareInstance] handleWithURLString:url.absoluteString complete:nil];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    
   if ([url.scheme isEqualToString:[WYRouter shareInstance].scheme]) {
       return [self handleOpenDeepLink:url];
    }
    return NO;
}

@end
