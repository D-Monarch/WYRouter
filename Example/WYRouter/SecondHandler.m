//
//  SecondHandler.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/5.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "SecondHandler.h"


@implementation SecondHandler
- (UIViewController<DPLTargetViewController> *)targetViewController {
    Class class = NSClassFromString(@"SecondViewController");
    return [class new];
}
@end
