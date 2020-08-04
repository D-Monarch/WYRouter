//
//  WYViewController.m
//  WYRouter
//
//  Created by htu_wang@163.com on 08/04/2020.
//  Copyright (c) 2020 htu_wang@163.com. All rights reserved.
//

#import "WYViewController.h"

@interface WYViewController ()

@end

@implementation WYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 200, 100, 50);
    btn1.backgroundColor = [UIColor yellowColor];
    [btn1 addTarget:self action:@selector(btnClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 300, 100, 50);
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 400, 100, 50);
    btn3.backgroundColor = [UIColor yellowColor];
    [btn3 addTarget:self action:@selector(btnClick3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    // Do any additional setup after loading the view.
}

- (void)btnClick {
    
    [[WYRouter shareInstance] handleWithModuleId:kWebModuleId
                                          params:@{@"url" : @"https://www.baidu.com"}
                                        complete:nil];
}

- (void)btnClick1 {
    
    NSString *urlString = @"wyy://auction/carDetail/12124123/1/12312312";
    [[WYRouter shareInstance] handleWithURLString:urlString complete:nil];
}


- (void)btnClick2 {
    
    NSString *urlString = @"wyy://auction/carDetail?carId=12124123&auctionType=1&auctionId=12312312";
    [[WYRouter shareInstance] handleWithURLString:urlString complete:nil];
}


- (void)btnClick3 {
    [[WYRouter shareInstance] handleWithURLString:@"https://www.baidu.com" complete:nil];
}
@end
