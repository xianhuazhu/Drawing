//
//  ViewController.m
//  02-AutoLayoutPractice1
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 视图添加
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    
    // 添加约束 method 1
//    [self setupLayout];
    
    // method 2
//    [self setupLayoutWithVFL];
    
    // masonry
    [self setupLayoutWithMasonry];
}

#pragma mark - setters & getters
- (UIView *)redView {
    if (_redView == nil) {
        _redView = [UIView new];
        // 属性设置
        _redView.backgroundColor = [UIColor redColor];
        _redView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _redView;
}

- (UIView *)greenView {
    if (_greenView == nil) {
        _greenView = [UIView new];
        // 属性设置
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _greenView;
}

- (UIView *)blueView {
    if (_blueView == nil) {
        _blueView = [UIView new];
        // 属性设置
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _blueView;
}

#pragma mark - layout
- (void)setupLayout {
    // redView
    NSLayoutConstraint *redViewLeft = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:30];
    NSLayoutConstraint *redViewTop = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    NSLayoutConstraint *redViewRight = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeLeading multiplier:1 constant:-30];
    NSLayoutConstraint *redViewBottom = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeTop multiplier:1 constant:-30];
    
    // greenView
    NSLayoutConstraint *greenViewRight = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-30];
    NSLayoutConstraint *greenViewCenterY = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *greenViewWidth = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *greenViewHeight = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    // blueView
    NSLayoutConstraint *blueViewLeft = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *blueViewRight = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *blueViewBottom = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-30];
    NSLayoutConstraint *blueViewHeight = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    [self.view addConstraints:@[redViewBottom,redViewLeft,redViewRight,redViewTop,greenViewCenterY,greenViewHeight,greenViewRight,greenViewWidth,blueViewBottom,blueViewHeight,blueViewLeft,blueViewRight]];
}

- (void)setupLayoutWithVFL {
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view, _redView, _greenView, _blueView);
    NSNumber *margin = @30;
    NSDictionary *metrics = NSDictionaryOfVariableBindings(margin);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_redView(_greenView)]-margin-[_greenView]-margin-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_blueView]-margin-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[_redView(_blueView)]-margin-[_blueView]-margin-|" options:0 metrics:metrics views:views]];
}

- (void)setupLayoutWithMasonry {
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.top.equalTo(self.view).with.offset(30);
        make.right.equalTo(_greenView.mas_left).with.offset(-30);
        make.bottom.equalTo(_blueView.mas_top).with.offset(-30);
    }];
    
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-30);
        make.centerY.equalTo(_redView);
        make.size.equalTo(_redView);
    }];
    
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_redView);
        make.right.equalTo(_greenView);
        make.bottom.equalTo(self.view).with.offset(-30);
        make.height.equalTo(_redView);
    }];
}
@end




























