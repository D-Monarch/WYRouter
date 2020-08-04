//
//  WYModuleModel.m
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WYModuleModel.h"

@implementation WYModuleModel

- (Class)handlerClass {
    
    return NSClassFromString(self.handlerClassName);
}

- (NSString *)routeWithScheme:(NSString *)scheme {
    
    return [NSString stringWithFormat:@"%@://%@", scheme, self.moduleId];
}

@end
