//
//  QYKeyFrameAnimationVC.m
//  01-CoreAnimationsDemo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYKeyFrameAnimationVC.h"

@interface QYKeyFrameAnimationVC ()
@property (nonatomic, strong) CALayer *platformLayer;
@property (nonatomic, strong) CALayer *marioLayer;
@end

#define kHalfScreenW    CGRectGetWidth(self.view.frame)/2.0

@implementation QYKeyFrameAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. setup layers
    [self setupLayers];
}

- (void)setupLayers {
    // 1. platform layer
    _platformLayer = [CALayer layer];
    
    // 1.1 外观
    _platformLayer.backgroundColor = [UIColor brownColor].CGColor;
    _platformLayer.cornerRadius = 13;
    
    // 1.2 几何
    _platformLayer.bounds = CGRectMake(0, 0, kHalfScreenW+20, 44);
    _platformLayer.anchorPoint = CGPointZero;
    _platformLayer.position = CGPointMake(kHalfScreenW, 200);
    
    // 1.3
    [self.view.layer addSublayer:_platformLayer];
    
    // 2. mario layer
    _marioLayer = [CALayer layer];
    
    _marioLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Mario"].CGImage);
    // 内容区域
    _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    _marioLayer.bounds = CGRectMake(0, 0, 32, 64);
    _marioLayer.anchorPoint = CGPointMake(0, 1);
    _marioLayer.position = CGPointMake(0, self.view.frame.size.height);
    
    [self.view.layer addSublayer:_marioLayer];
}

- (IBAction)jump:(id)sender {
    
    [CATransaction begin];
    
    // 1. 创建关键帧动画对象
    CAKeyframeAnimation *jumpAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    // 2. 属性设置
    
    [CATransaction setCompletionBlock:^{
        // 把隐式动画的效果关掉
        [CATransaction setDisableActions:YES];
        _marioLayer.position = CGPointMake(kHalfScreenW+10, 200);
        _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1); // 右半部分
    }];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    // 左半部分
    _marioLayer.contentsRect = CGRectMake(0, 0, 0.5, 1);
    [CATransaction commit];
    
    jumpAnim.duration = 1.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    // 移动画笔到起点
    CGPathMoveToPoint(path, NULL, 0, self.view.frame.size.height);
    CGPathAddCurveToPoint(path, NULL, 30, 140, kHalfScreenW+10, 140, kHalfScreenW+10, 200);
    jumpAnim.path = path;
    
    // 3. 添加到layer上
    [_marioLayer addAnimation:jumpAnim forKey:nil];
    
    [CATransaction commit];
}



@end
