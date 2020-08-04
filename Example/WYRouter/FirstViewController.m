//
//  FirstViewController.m
//  LBRouterDemo
//
//  Created by yao wang on 2019/12/4.
//  Copyright © 2019 yao wang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
}


- (void)configureWithDeepLink:(DPLDeepLink *)deepLink {
    //正常字典参数
    NSLog(@"%@", deepLink.queryParameters);
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
