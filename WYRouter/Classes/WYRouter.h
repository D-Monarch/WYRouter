//
//  WYRouter.h
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYModuleModel;

#define kWebModuleId @"WebViewControllerModule"

NS_ASSUME_NONNULL_BEGIN

@interface WYRouter : NSObject

/// Scheme 协议
@property (readonly, nonatomic, copy, nonnull) NSString *scheme;
/// 版本号
@property (readonly, nonatomic, copy, nullable) NSString *version;

+ (instancetype)shareInstance;

/// Route Regist
/// @param scheme scheme
/// @param version version
/// @param modules regist table
- (void)registHandlerClassWithScheme:(NSString *)scheme
                             version:(NSString *)version
                             modules:(NSArray<WYModuleModel *> *)modules;


/// Routing depends on the module ID and parameters for the jump
/// @param moduleId module ID
/// @param params parameters
/// @param complete handle complete
- (BOOL)handleWithModuleId:(NSString *)moduleId
                    params:(nullable NSDictionary *)params
                  complete:(nullable void(^)(BOOL handled, NSError *error))complete;


/// Routes rely on links to achieve jumps
/// @param urlString link - URL parameters are spliced with '&'
/// @param complete handle complete
- (BOOL)handleWithURLString:(NSString *)urlString
                   complete:(nullable void(^)(BOOL handled, NSError *error))complete;


@end

NS_ASSUME_NONNULL_END
