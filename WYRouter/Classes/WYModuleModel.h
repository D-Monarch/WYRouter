//
//  WYModuleModel.h
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYModuleModel : JSONModel

/** 页面ID */
@property (nonatomic, copy) NSString *moduleId;

/** 页面名称  */
@property (nonatomic, copy) NSString *moduleName;

/** handler类名称 */
@property (nonatomic, copy) NSString *handlerClassName;

/** 路由 */
@property (nonatomic, strong) NSArray<NSString *> *routes;

- (Class)handlerClass;

- (NSString *)routeWithScheme:(NSString *)scheme;

@end

NS_ASSUME_NONNULL_END
