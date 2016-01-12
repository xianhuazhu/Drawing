//
//  QYTransition1VC.m
//  01-CoreAnimationsDemo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTransition1VC.h"

@interface QYTransition1VC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSArray *images;
@end

@implementation QYTransition1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    _images = @[
                [UIImage imageNamed:@"1.jpg"],
                [UIImage imageNamed:@"2.jpg"],
                [UIImage imageNamed:@"3.jpg"],
                [UIImage imageNamed:@"4.jpg"],
                [UIImage imageNamed:@"5.jpg"],
                [UIImage imageNamed:@"6.jpg"],
                ];
}

- (IBAction)changeImage:(id)sender {
    static int index = 1;
    // 1. 创建转场动画对象
    CATransition *transition = [CATransition animation];
    
    // 2. 设置属性
//    transition.type = kCATransitionPush;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    
    // 3. 添加动画
    [_imageView.layer addAnimation:transition forKey:nil];
    
    UIImage *image = _images[index];
    _imageView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    index = (index+1) % 6;
}


@end
