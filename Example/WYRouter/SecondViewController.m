//
//  SecondViewController.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)configureWithDeepLink:(DPLDeepLink *)deepLink {
    //路由参数
    NSLog(@"%@", deepLink.routeParameters);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[WYRouter shareInstance] handleSelWithMoudleId:@"SecondViewController" selector:@"test:" params:@"aaaa" complete:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
