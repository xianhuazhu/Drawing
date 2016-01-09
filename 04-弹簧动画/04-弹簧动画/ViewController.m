//
//  ViewController.m
//  04-弹簧动画
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, strong) NSMutableArray *btnMenus;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createBtns];
}

- (void)createBtns {
    CGFloat btnW = 71.f;
    CGFloat btnH = 71.f;
    
    CGFloat marginX = (CGRectGetWidth(self.view.frame) - 3 * btnW) / 4.0;
    CGFloat marginY = 35;
    
    NSArray *imgNames = @[@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review"];
    
    _btnMenus = [NSMutableArray array];
    for (int i = 0; i < imgNames.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 属性设置
        int column = i % 3;
        int row = i / 3;
        CGFloat btnX = marginX + column*(btnW+marginX);
        CGFloat btnY = marginY + CGRectGetHeight(self.view.frame) + row*(btnH+marginY);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setImage:[UIImage imageNamed:imgNames[i]] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(onMenuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        [_btnMenus addObject:btn];
    }
}

- (IBAction)startAnimation:(id)sender {
    if (_isShow) {
        [self hideBtnsWithAnimation:YES];
    } else {
        [self showBtnsWithAnimation:YES];
    }
}

- (void)hideBtnsWithAnimation:(BOOL)animate {
    if (animate) {
        for (int i = 0; i < _btnMenus.count; i++) {
            [UIView animateWithDuration:0.6 delay:i*0.02 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
                UIButton *btn = _btnMenus[_btnMenus.count-i-1];
                NSLog(@">>%@", [btn.layer actionForKey:@"position"]);
                CGPoint center = btn.center;
                center.y += 500;
                btn.center = center;
            } completion:nil];
        }
    } else {
        for (int i = 0; i < _btnMenus.count; i++) {
            UIButton *btn = _btnMenus[i];
            NSLog(@">>%@", [btn.layer actionForKey:@"position"]);            
            CGPoint center = btn.center;
            center.y += 500;
            btn.center = center;
        }
    }
    
    _isShow = NO;
}

- (void)showBtnsWithAnimation:(BOOL)animate {
    if (animate) {
        for (int i = 0; i < _btnMenus.count; i++) {
            [UIView animateWithDuration:0.5 delay:i*0.02 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
                UIButton *btn = _btnMenus[i];
                CGPoint center = btn.center;
                center.y -= 500;
                btn.center = center;
            } completion:nil];
        }
    } else {
        for (int i = 0; i < _btnMenus.count; i++) {
            UIButton *btn = _btnMenus[i];
            CGPoint center = btn.center;
            center.y -= 500;
            btn.center = center;
        }
    }
    _isShow = YES;
}

- (void)onMenuBtnClicked:(UIButton *)btn {
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformScale(btn.transform, 1.7, 1.7);
        btn.alpha = 0.3;
    } completion:^(BOOL finished) {
        btn.transform = CGAffineTransformIdentity;
        btn.alpha = 1.0;
        
        [self hideBtnsWithAnimation:NO];
    }];
}

@end
