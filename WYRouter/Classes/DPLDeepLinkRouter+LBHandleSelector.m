//
//  DPLDeepLinkRouter+LBHandleSelector.m
//  DeepLinkKit
//
//  Created by yao wang on 2020/8/12.
//

#import "DPLDeepLinkRouter+LBHandleSelector.h"
#import <objc/runtime.h>
#import "WYRouterBaseHandler.h"
#import "DPLRouteMatcher.h"
#import "DPLMutableDeepLink.h"

@implementation DPLDeepLinkRouter (LBHandleSelector)


- (BOOL)handleSelWithURLString:(NSString *)url
                      selector:(NSString *)selector
                        params:(id)params
                      complete:(void(^)(BOOL handled, NSError *error))completionHandler {
    
    NSError *error = nil;
    __block BOOL handled = NO;
    
    id handler = self[url];
    
    if (class_isMetaClass(object_getClass(handler)) &&
        [handler isSubclassOfClass:[DPLRouteHandler class]]) {
        
        DPLMutableDeepLink *deepLink = [[DPLMutableDeepLink alloc] initWithString:url];
        
        WYRouterBaseHandler *routeHandler = [[handler alloc] init];
        
        UIViewController *targetViewControlelr = [routeHandler viewControllerForPresentingDeepLink:deepLink];
        
        if ([targetViewControlelr isKindOfClass:[UINavigationController class]] && ((UINavigationController *)targetViewControlelr).childViewControllers.count > 1) {
            
            UINavigationController *nav = (UINavigationController *)targetViewControlelr;
            targetViewControlelr = nav.childViewControllers[nav.childViewControllers.count - 2];
        }
        
        NSArray *selectors = [routeHandler performSelector];
        
        if (targetViewControlelr && [selectors containsObject:selector]) {
            
            [selectors enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj isEqualToString:selector] && [targetViewControlelr respondsToSelector:NSSelectorFromString(obj)]) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        SEL selector = NSSelectorFromString(obj);
                        IMP imp = [targetViewControlelr methodForSelector:selector];
                        void (*func)(id, SEL, id) = (void *)imp;
                        func(targetViewControlelr, selector, params);
                    });
                    handled = YES;
                }
            }];
        } else {
            
            error = [NSError errorWithDomain:@"com.lionbridge.error" code:1000 userInfo:@{NSLocalizedDescriptionKey : @"方法不存在或未实现"}];
        }
    } else {
        error = [NSError errorWithDomain:@"com.lionbridge.error" code:999 userInfo:@{NSLocalizedDescriptionKey : @"处理类不存在"}];
    }
    if (completionHandler) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(handled, error);
        });
    }
    
    return YES;
}


@end
