//
//  WYAppDelegate+DeepLink.h
//  WYRouter_Example
//
//  Created by yao wang on 2020/8/4.
//  Copyright © 2020 htu_wang@163.com. All rights reserved.
//
#import "WYAppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAppDelegate (DeepLink)

- (BOOL)handleOpenURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
