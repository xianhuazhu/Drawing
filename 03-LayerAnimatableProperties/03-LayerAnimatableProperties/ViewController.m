//
//  ViewController.m
//  03-LayerAnimatableProperties
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYLayer.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 创建一个layer
    CALayer *layer = [CALayer layer];
    
    // 2. 几何尺寸
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = self.view.center;
    
    // 3. 外观
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    
    _layer = layer;
    
    // 4. 添加layer
    [self.view.layer addSublayer:layer];
    
    _maskLayer = [CALayer layer];
//    _maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"opacity"].CGImage);
    _maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"test"].CGImage);    
    _maskLayer.bounds = CGRectMake(0, 0, 100, 100);
    _maskLayer.position = CGPointMake(100, 100);
}

- (IBAction)toggleBorder:(id)sender {
    if (_layer.borderWidth > 0) {
        _layer.borderWidth = 0;
    } else {
        _layer.borderWidth = 5;
        _layer.borderColor = [UIColor blueColor].CGColor;
    }
}

- (IBAction)toggleOpacity:(id)sender {
    if (_layer.opacity < 1) {
        _layer.opacity = 1;
    } else {
        _layer.opacity = 0.5;
    }
}

- (IBAction)toggleShadow:(id)sender {
    if (_layer.shadowOpacity > 0) {
        _layer.shadowOpacity = 0;
    } else {
        _layer.shadowOpacity = 1;
        _layer.shadowRadius = 15;
    }
}

- (IBAction)toggleMask:(id)sender {
    _layer.mask = _layer.mask == nil ? _maskLayer : nil;
}

- (IBAction)toggleSubLayer:(id)sender {
    
        NSString *className =  NSStringFromClass([QYLayer class]);
    NSLog(@"%@", className);
    
    
    if (_layer.sublayers == nil) {
        QYLayer *subLayer = [NSClassFromString(@"QYLayer") layer];
        subLayer.name = @"sublayer";
        subLayer.bounds = CGRectMake(0, 0, 100, 100);
        subLayer.position = CGPointMake(100, 100);
        
//        subLayer.backgroundColor = [UIColor grayColor].CGColor;
        
//        [subLayer setNeedsDisplay];
        [subLayer display];
        
        [_layer addSublayer:subLayer];
    } else {
        for (CALayer *layer in _layer.sublayers) {
//            if ([layer.name isEqualToString:@"sublayer"]) {
//                [layer removeFromSuperlayer];
//            }
            if ([layer isKindOfClass:[QYLayer class]]) {
                [layer removeFromSuperlayer];
            }
        }
    }
    

}

@end
