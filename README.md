# WYRouter

[![CI Status](https://img.shields.io/travis/htu_wang@163.com/WYRouter.svg?style=flat)](https://travis-ci.org/htu_wang@163.com/WYRouter)
[![Version](https://img.shields.io/cocoapods/v/WYRouter.svg?style=flat)](https://cocoapods.org/pods/WYRouter)
[![License](https://img.shields.io/cocoapods/l/WYRouter.svg?style=flat)](https://cocoapods.org/pods/WYRouter)
[![Platform](https://img.shields.io/cocoapods/p/WYRouter.svg?style=flat)](https://cocoapods.org/pods/WYRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0 or later


## Installation

LBRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LBRouter'
```

## How To Use 

The LBRouter needs to be registered when the program starts

```Object-C
+ (void)configRouteWithScheme:(NSString *)scheme fileName:(NSString *)fileName;
```


Routing callback processing

```Object-C
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    
    // NSUserActivityTypeBrowsingWeb 由Universal Links唤醒的APP
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        [self handleOpenDeepLink:userActivity.webpageURL];
    }
    return YES;
}

- (BOOL)handleOpenDeepLink:(NSURL *)url {
    
   return [[LBRouter shareInstance] handleWithURLString:url.absoluteString complete:nil];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    
   if ([url.scheme isEqualToString:[LBRouter shareInstance].scheme]) {
       return [self handleOpenDeepLink:url];
    }
    return NO;
}
```


## Author

htu_wang@163.com, wangyaoyao@lionbridgecapital.cn

## License

WYRouter is available under the MIT license. See the LICENSE file for more info.
