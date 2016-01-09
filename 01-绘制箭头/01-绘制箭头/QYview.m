//
//  QYview.m
//  01-绘制箭头
//
//  Created by qingyun on 16/1/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYview.h"

@implementation QYview


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
#if 0
    //1.获取bezierPath 对象
    UIBezierPath *path=[UIBezierPath bezierPath];

    //绘制箭头
    [path moveToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(140, 30)];
    [path addLineToPoint:CGPointMake(60, 30)];
    //关闭路径
    [path closePath];
    //渲染下
    [[UIColor redColor] setFill];
    [path fill];
    
    //移除掉所有的点
    [path removeAllPoints];
    
    //绘制箭轴
    //设置线宽
    [path setLineWidth:20];
    //移动画笔到（80，30）
    [path moveToPoint:CGPointMake(100, 30)];
    [path addLineToPoint:CGPointMake(100, 120)];
     //设置描边色
    [[UIColor blackColor] setStroke];
    [path stroke];
#endif
    //1.获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    
    //设置不绘制图像的剪切区域
    CGContextMoveToPoint(ctx, 90, 150);
    CGContextAddLineToPoint(ctx, 110, 150);
    CGContextAddLineToPoint(ctx, 100, 180);
    //关闭路径
    CGContextClosePath(ctx);
    //在矩形区域内设置三角形的剪切区域；
    //CGRect rect1=CGRectMake(60, 0,80,10);
    CGContextAddRect(ctx, rect);
    //通过奇偶剪切法则剪切不绘制区域
    CGContextEOClip(ctx);
    
    
    //绘制红色三角形
    CGContextMoveToPoint(ctx, 100, 0);
    CGContextAddLineToPoint(ctx, 60, 30);
    CGContextAddLineToPoint(ctx, 140, 30);
    [[UIColor redColor] setFill];
    CGContextFillPath(ctx);
    
    //绘制轴
    //设置轴颜色
    [[UIColor blackColor] setStroke];
     CGContextSetLineWidth(ctx, 20);
    //移动画笔（100，30）
    CGContextMoveToPoint(ctx, 100, 30);
    CGContextAddLineToPoint(ctx, 100, 180);
    CGContextStrokePath(ctx);
    
    
    
}


@end
