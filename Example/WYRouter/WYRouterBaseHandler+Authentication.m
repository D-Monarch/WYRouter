//
//  WYRouterBaseHandler+Authentication.m
//  WYRouter_Example
//
//  Created by yao wang on 2020/8/4.
//  Copyright © 2020 htu_wang@163.com. All rights reserved.
//

#import "WYRouterBaseHandler+Authentication.h"


@implementation WYRouterBaseHandler (Authentication)


- (BOOL)shouldHandleDeepLink:(DPLDeepLink *)deepLink {

    if ([self requirePermissionAuthentication]) { //需要权限验证
//            //登录权限验证
//            if (!isLogin) {
//                //去登陆
//
//                return NO;
//            }
    }

    return YES;
}

@end
