//
//  WYRouteConfig.h
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYRouteConfig : NSObject

/// 路由配置
/// @param scheme 协议
/// @param fileName 注册表文件名
+ (void)configRouteWithScheme:(NSString *)scheme fileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
