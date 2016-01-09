//
//  ViewController.m
//  05-UIView-Layer
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *ctmView;
@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 240, 128);
    layer.position = CGPointMake(115, 300);
    layer.anchorPoint = CGPointZero;
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
}


- (IBAction)changeColor:(id)sender {
//    _ctmView.layer.backgroundColor = [UIColor greenColor].CGColor;
    _ctmView.layer.cornerRadius = 20;
}

- (IBAction)changeLayerColor:(id)sender {
//    _layer.backgroundColor = [UIColor greenColor].CGColor;
    _layer.cornerRadius = 20;
}


@end
