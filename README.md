# WYRouter
[![Pod](https://img.shields.io/badge/Pod-V1.0.0-blue)](https://github.com/D-Monarch/WYRouter)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey)](https://github.com/D-Monarch/WYRouter)
[![License](https://img.shields.io/github/license/D-Monarch/WYRouter)](https://github.com/D-Monarch/WYRouter/blob/master/LICENSE)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0 or later


## Installation

LBRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WYRouter'
```

## How To Use 

The WYRouter needs to be registered when the program starts

```Object-C
+ (void)configRouteWithScheme:(NSString *)scheme fileName:(NSString *)fileName;
```

Routing callback processing

```Object-C
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    
    // NSUserActivityTypeBrowsingWeb 由Universal Links唤醒的APP
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        [[WYRouter shareInstance] handleWithURLString:userActivity.webpageURL.absoluteString complete:nil];
    }
    return YES;
}


- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    return [self handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation{
    
    return [self handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
   return [self handleOpenURL:url];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    
   if ([url.scheme isEqualToString:[WYRouter shareInstance].scheme]) {
        return [[WYRouter shareInstance] handleWithURLString:url.absoluteString complete:nil];
   }
   return NO;
}

```


## Registry structure

``` Json
{
    "version" : "1.0",
    "modules" : [
        {
            "moduleId" : "WebViewModule",
            "moduleName" : "web页面",
            "handlerClassName" : "WebRounterHandler",
            "routes" : [
            ]
        }
    ]
}
```
 
## Supported routing structures

1、https://www.baidu.com   
2、Route：wyy://carDetail/:carId/:carType                  
    Get parameters：deepLink.routeParameters   
3、Route：wyy://carDetail?carId=string&carType=int        
    Get parameters：deepLink.queryParameters   


## Author

htu_wang@163.com, wangyaoyao@lionbridgecapital.cn

## License

WYRouter is available under the MIT license. See the LICENSE file for more info.
