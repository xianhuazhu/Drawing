//
//  QYview.m
//  01-绘制箭头
//
//  Created by qingyun on 16/1/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYview.h"

@interface QYview ()
@property(nonatomic,assign)float starX;
@property(nonatomic,assign)float starY;
@end

@implementation QYview


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    NSInteger randY=rect.size.height;
    NSInteger randX=rect.size.width;
    _starY+=arc4random()%5;
    _starX+=arc4random()%2;
    if (_starY>randY||_starX>randX) {
        _starX=0;
        _starY=0;
    }
    
    UIImage *image=[UIImage imageNamed:@"star"];
    [image drawAtPoint:CGPointMake(_starX, _starY)];
}


@end
