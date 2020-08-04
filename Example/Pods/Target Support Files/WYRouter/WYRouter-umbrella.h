#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "WYModuleModel.h"
#import "WYRoute.h"
#import "WYRouteConfig.h"
#import "WYRouter.h"
#import "WYRouterBaseHandler.h"

FOUNDATION_EXPORT double WYRouterVersionNumber;
FOUNDATION_EXPORT const unsigned char WYRouterVersionString[];

