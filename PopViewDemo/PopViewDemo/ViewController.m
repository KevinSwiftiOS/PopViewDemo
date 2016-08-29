//
//  ViewController.m
//  PopViewDemo
//
//  Created by hznucai on 2016/8/28.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import "ViewController.h"
#import "PopAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//进行显示
-(IBAction)shoeAction:(UIButton *)sender{
    NSArray *array = @[@"1、每天签到可获得5个金币，连续签到7天可以获得额外15金币的奖励。",
                       @"2、金币可以用于订单结算时抵扣现金或者参与抽奖活动。",
                       @"3、每个金币可以抵扣0.01元。"];
    [PopAlertView showWithFrame:CGRectMake(50, 64, 183, 160) WithTextArray:array];
    
}
@end
