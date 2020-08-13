//
//  WYRouterBaseHandler.m
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WYRouterBaseHandler.h"

@implementation WYRouterBaseHandler

- (BOOL)requirePermissionAuthentication {
    return YES;
}


- (BOOL)shouldHandleDeepLink:(DPLDeepLink *)deepLink {
    return YES;
}


- (BOOL)preferModalPresentation {
    return NO;
}


- (NSArray *)performSelectors {
    return nil;
}

- (UIViewController *)viewControllerForPresentingDeepLink:(DPLDeepLink *)deepLink {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabVc = (UITabBarController *)vc;
        return tabVc.selectedViewController;
    }
    return vc;
}


- (void)presentTargetViewController:(UIViewController<DPLTargetViewController> *)targetViewController inViewController:(UIViewController *)presentingViewController {
    
    if ([self preferModalPresentation] ||
        ![presentingViewController isKindOfClass:[UINavigationController class]]) {
        
        [presentingViewController presentViewController:targetViewController animated:YES completion:NULL];
    }
    else if ([presentingViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *nav = (UINavigationController *)presentingViewController;
        if ([nav.viewControllers containsObject:targetViewController]) {
            [nav popToViewController:targetViewController animated:YES];
        } else {
            
            for (UIViewController *controller in nav.viewControllers ) {
                if ([controller isMemberOfClass:[targetViewController class]]) {
                    
                    [nav  popToViewController:controller animated:YES];
                    [nav popViewControllerAnimated:YES];
                    
                    if ([controller isEqual:nav.topViewController]) {
                        [nav setViewControllers:@[targetViewController] animated:YES];
                    }
                    
                    break;
                }
            }
            if (![nav.topViewController isEqual:targetViewController]) {
                [nav pushViewController:targetViewController animated:YES];
            }
        }
    }
}


@end
