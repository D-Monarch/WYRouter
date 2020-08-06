//
//  WYRouter.m
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WYRouter.h"
#import "WYModuleModel.h"
#import "DeepLinkKit/DeepLinkKit.h"

@interface WYRouter ()
/** 路由 */
@property (nonatomic, strong) DPLDeepLinkRouter *router;

/// Scheme 协议
@property (readwrite, nonatomic, copy, nonnull) NSString *scheme;

/// 版本号
@property (readwrite, nonatomic, copy, nullable) NSString *version;

/** 注册表 */
@property (nonatomic, strong) NSArray<WYModuleModel *> *modules;

@end

@implementation WYRouter

+ (instancetype)shareInstance {
    
    static WYRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        router = [[WYRouter alloc] init];
    });
    return router;
}


- (instancetype)init {
    
    if (self == [super init]) {
        
        _router = [[DPLDeepLinkRouter alloc] init];
    }
    return self;
}

- (void)registHandlerClassWithScheme:(NSString *)scheme
                             version:(NSString *)version
                             modules:(NSArray<WYModuleModel *> *)modules {
    _scheme = scheme;
    _modules = modules;
    _version = version;
    for (WYModuleModel *model in modules) {
        
        Class class = [model handlerClass];
        if (class) {
            
            for (NSString *route in model.routes) {
                
                [_router registerHandlerClass:class forRoute:[[route componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"?"]] firstObject]];
                NSLog(@"注册路由：%@", route);
            }
            [_router registerHandlerClass:class forRoute:[model routeWithScheme:_scheme]];
            NSLog(@"注册路由：%@", [model routeWithScheme:_scheme]);
        }
    }
}

/// 路由跳转
/// @param moduleId 模块ID
/// @param params 参数
/// @param complete complete
- (BOOL)handleWithModuleId:(NSString *)moduleId
                    params:(NSDictionary *)params
                  complete:(void(^)(BOOL handled, NSError *error))complete {
    
    if (moduleId) {
        NSString *url = [self routeWithModuleId:moduleId];
        DPLMutableDeepLink *link = [[DPLMutableDeepLink alloc] initWithString:url];
        [link.queryParameters addEntriesFromDictionary:params]; //经DPLMutableDeepLink转化为&拼接形式连接
        
        return [self handleWithURLString:link.URL.absoluteString complete:complete];
    }
    return NO;
}

/// 路由跳转
/// @param urlString urlString
///
/// DPLMutableDeepLink可以实现两种形式URL：
/// 1.&拼接形式URL（youche://auction/carDetail?carId=int&auctionType=int&auctionId=int）
/// 2.路由形式URL（youche://auction/carDetail/:carId/:auctionType/:auctionId）
///
/// DPLMutableDeepLink提供了两种参数形式：
/// 1.routeParameters（对应路由形式URL）
/// 2.queryParameters（对应&拼接形式URL）
/// 两种参数不能共存.
///
/// 1.路由形式URL使用时直接转NSURL，处理完取参数时需要取路由参数routeParameters.
///   queryParameters为空，无法取到，除非把上面路由参数转为&拼接形式
///
/// 2.&拼接形式URL，处理完取参数需要取queryParameters.
///   routeParameters为空，除非把URL参数转为路由形式
///
/// WYRoutrerMgr采用&拼接形式URL实现，符合开发者习惯
/// @param complete complete
- (BOOL)handleWithURLString:(NSString *)urlString
             complete:(void(^)(BOOL handled, NSError *error))complete {
    
    if (urlString.length <= 0) {
        return NO;
    }
    NSURL *url = [self urlWithString:urlString];
    if ([@[@"http", @"https"] containsObject:url.scheme]) {
        
        NSString *urlStr = [url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] ?: @"";

       return [self handleWithModuleId:kWebModuleId
                                params:@{@"url" : urlStr}
                              complete:complete];

    } else if ([url.scheme isEqualToString:_scheme]) {
        
        return [_router handleURL:url withCompletion:complete];
    }
    return NO;
}


/// Get route by module ID
/// @param moduleId module ID
- (NSString *)routeWithModuleId:(NSString *)moduleId {
    
    NSString *route = nil;
    for (WYModuleModel *model in _modules) {
        if ([moduleId isEqualToString:model.moduleId]) {
            route = [model routeWithScheme:_scheme];
        }
    }
    return route;
}


/// Convert urlString to URL
/// @param urlString url string
- (NSURL *)urlWithString:(NSString *)urlString {
    
    if (urlString.length) {
      if (@available(iOS 9.0, *)) {
          return [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
      } else {
          return [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
      }
    }
  
    return nil;
}
@end
