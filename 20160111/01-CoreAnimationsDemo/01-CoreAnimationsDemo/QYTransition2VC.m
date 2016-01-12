//
//  QYTransition2VC.m
//  01-CoreAnimationsDemo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTransition2VC.h"

@interface QYTransition2VC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *type;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subtype;
@property (nonatomic, strong) CALayer *containerLayer;
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@end

@implementation QYTransition2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. setup layers
    [self setupLayers];
}

- (void)setupLayers {
    _containerLayer = [CALayer layer];
    _containerLayer.bounds = CGRectMake(0, 0, 180, 180);
    _containerLayer.position = CGPointMake(180, 300);
    [self.view.layer addSublayer:_containerLayer];
    
    // red layer
    _redLayer = [CALayer layer];
    _redLayer.backgroundColor = [UIColor redColor].CGColor;
    _redLayer.anchorPoint = CGPointZero;
    _redLayer.position = CGPointZero;
    _redLayer.bounds = CGRectMake(0, 0, 180, 180);
    [_containerLayer addSublayer:_redLayer];
    _redLayer.hidden = NO;
    
    // green layer
    _greenLayer = [CALayer layer];
    _greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    _greenLayer.anchorPoint = CGPointZero;
    _greenLayer.position = CGPointZero;
    _greenLayer.bounds = _redLayer.bounds;
    [_containerLayer addSublayer:_greenLayer];
    _greenLayer.hidden = YES;
}


- (IBAction)transition:(id)sender {
    CATransition *transition = [CATransition animation];
    
    NSArray *types = @[kCATransitionFade, kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal];
    NSArray *subtypes = @[kCATransitionFromRight, kCATransitionFromLeft, kCATransitionFromTop, kCATransitionFromBottom];
    
    transition.type = types[_type.selectedSegmentIndex];
    transition.subtype = subtypes[_subtype.selectedSegmentIndex];
    
    [_containerLayer addAnimation:transition forKey:nil];
    
    // 触发
    _redLayer.hidden = !_redLayer.hidden;
    _greenLayer.hidden = !_greenLayer.hidden;
}

@end
