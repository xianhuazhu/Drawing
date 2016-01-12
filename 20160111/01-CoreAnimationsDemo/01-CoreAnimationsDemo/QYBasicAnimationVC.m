//
//  QYBasicAnimationVC.m
//  01-CoreAnimationsDemo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYBasicAnimationVC.h"

@interface QYBasicAnimationVC ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation QYBasicAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. setup layers
    
    // 2. 为图层添加动画
    [self addAnimation4Layer:_layer];
}

- (void)setupLayers {
    // 1. 创建图层
    _layer = [CALayer layer];
    
    // 2. 属性设置
    // 2.1 外观
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.cornerRadius = 25;
    
    // 2.2 几何
    _layer.bounds = CGRectMake(0, 0, 200, 200);
    _layer.position = self.view.center;
    
    // 3. 添加
    [self.view.layer addSublayer:_layer];
}

- (void)addAnimation4Layer:(CALayer *)layer {
    // 1. 创建动画对象
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"]; /*虚拟属性*/
    
    // 2. 设置动画对象的属性
    scaleAnim.duration = .2;
    scaleAnim.toValue = @1.3;
    scaleAnim.autoreverses = YES;
    scaleAnim.repeatCount = FLT_MAX;
//    scaleAnim.timingFunction
    
    // 3. 将动画对象添加到图层上
    [layer addAnimation:scaleAnim forKey:nil];
}

@end
