//
//  WYRouterBaseHandler.h
//  WYRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeepLinkKit/DeepLinkKit.h"


NS_ASSUME_NONNULL_BEGIN

@interface WYRouterBaseHandler : DPLRouteHandler

/**
 Indicates whether the deep link should be handled.
 @param deepLink A deep link instance.
 @return YES to proceed with handling the deep link, otherwise NO. The default is YES.
 */
- (BOOL)shouldHandleDeepLink:(DPLDeepLink *)deepLink;



/**
 If `viewControllerForPresentingDeepLink:' returns a `UINavigationController', the default behavior
 is to place the `targetViewController' in the navigation stack. If you prefer to always present
 the target view controller modally, override this method and return YES. The default is NO.
 */
- (BOOL)preferModalPresentation;



/// Whether permission authentication is required（Login permission）
- (BOOL)requirePermissionAuthentication;

@end

NS_ASSUME_NONNULL_END
