//
//  ViewController.m
//  06-AutolayoutAnimationDemo
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic, assign) BOOL isDown;
@property (weak, nonatomic) IBOutlet UIView *view2Animate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)moveDown:(id)sender {
    if (_isDown) {
        // 上去
        [self changeConstraintsWithValue:-226];
    } else {
        // 下来
        [self changeConstraintsWithValue:0];
    }
    
    _isDown = !_isDown;
}

- (void)changeConstraintsWithValue:(CGFloat)value {
    _topConstraint.constant = value;
    [UIView animateWithDuration:0.5 animations:^{
//        [_view2Animate layoutIfNeeded];
        [self.view layoutIfNeeded];
    }];
}


@end
