//
//  WebRounterHandler.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/6.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "WebRounterHandler.h"

@implementation WebRounterHandler
- (UIViewController<DPLTargetViewController> *)targetViewController {
    Class class = NSClassFromString(@"WebViewController");
    return [class new];
}


@end
