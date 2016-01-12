//
//  QYGrpAnimationVC.m
//  01-CoreAnimationsDemo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYGrpAnimationVC.h"

@interface QYGrpAnimationVC ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation QYGrpAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. setup layers
    [self setupLayers];
    
    // 2. 为图层添加动画
    [self addAnimations4Layer:_layer];
}

- (void)addAnimations4Layer:(CALayer *)layer {
    // 1. 创建动画
    CAAnimationGroup *animGrp = [CAAnimationGroup animation];
    
    // 2. 属性设置
    // 2.1 scale
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.toValue = @1.3;
    scaleAnim.duration = 2.0;
    
    // 2.2 rotation
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnim.toValue = @M_PI_4;
    rotationAnim.duration = 0.5;
    rotationAnim.beginTime = 0.5;
    rotationAnim.fillMode = kCAFillModeForwards;
    
    // 2.3 color
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    colorAnim.fromValue = (__bridge id _Nullable)([UIColor yellowColor].CGColor);
    colorAnim.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    colorAnim.duration = 1.5;
    colorAnim.beginTime = 0.5;
//    colorAnim.fillMode = kCAFillModeBoth;
    
    // 2.4 group
    animGrp.animations = @[scaleAnim, rotationAnim, colorAnim];
    animGrp.duration = 2.0;
    animGrp.autoreverses = YES;
    animGrp.repeatCount = FLT_MAX;
    animGrp.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 3. 添加到图层上
    [_layer addAnimation:animGrp forKey:nil];
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

@end
