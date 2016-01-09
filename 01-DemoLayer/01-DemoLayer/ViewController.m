//
//  ViewController.m
//  01-DemoLayer
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建一个图层
    CALayer *layer = [CALayer layer];
    
    // 2. 构建图层的内容
    
    // 2.1 method 1
//    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dorayo.jpeg"].CGImage);
    
    // 3. 设置几何属性
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = self.view.center;
    layer.zPosition = 1;

    layer.cornerRadius = 15;
    layer.masksToBounds = YES;
    
    [self.view.layer addSublayer:layer];
    
     // 2.2 method 2
    QYLayer *layer2 = [QYLayer layer];
    
    layer2.bounds = CGRectMake(0, 0, 200, 200);
    layer2.position = CGPointMake(100, 300);
    layer2.anchorPoint = CGPointMake(0, 0);
  
    layer2.backgroundColor = [UIColor yellowColor].CGColor;
//    [layer2 setNeedsDisplay];
    
    [self.view.layer addSublayer:layer2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
