//
//  WYRouteConfig.m
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WYRouteConfig.h"
#import "WYModuleModel.h"
#import "WYRouter.h"

@implementation WYRouteConfig

+ (void)configRouteWithScheme:(NSString *)scheme
                     fileName:(nonnull NSString *)fileName  {
   
    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];

    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error;
            NSData *data = [NSData dataWithContentsOfFile:filePath
                                                  options:0
                                                    error:&error];
            
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableLeaves
                                                                       error:nil];
            NSArray *array = nil;
            if (!error) {
                array = [WYModuleModel arrayOfModelsFromDictionaries:jsonDict[@"modules"] error:&error];
            } else {
                NSLog(@"注册表解析错误：%@", error);
            }
            [[WYRouter shareInstance] registHandlerClassWithScheme:scheme
                                                              version:jsonDict[@"version"]
                                                              modules:array];
        });
    } else {
        NSLog(@"注册表不存在");
    }
}

@end
