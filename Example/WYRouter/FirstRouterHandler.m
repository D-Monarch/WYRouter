//
//  FirstRouterHandler.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "FirstRouterHandler.h"

@implementation FirstRouterHandler

- (UIViewController<DPLTargetViewController> *)targetViewController {
    Class class = NSClassFromString(@"FirstViewController");
    return [class new];
}

@end
