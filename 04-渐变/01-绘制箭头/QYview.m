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
    //1.获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    
    //设置不绘制图像的剪切区域
    CGContextMoveToPoint(ctx, 90, 120);
    CGContextAddLineToPoint(ctx, 110, 120);
    CGContextAddLineToPoint(ctx, 100, 100);
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
    CGContextAddLineToPoint(ctx, 100, 120);
    //此处不用CGContextStrokePath(ctx);用下边的CGContextReplacePathWithStrokedPath(ctx);才可实现效果
    //CGContextStrokePath(ctx);
    
    
    //将描边路径转换成fill填充路径
    CGContextReplacePathWithStrokedPath(ctx);
    
    //实加非零饶数法则，该规则使用后，将来只有stroke转换成fill路径
    //才可以绘制
    CGContextClip(ctx);
    
   //保存当前的剪切区域
    CGContextSaveGState(ctx);
    
    //添加渐变效果
    //创建渐变对象
    CGColorSpaceRef space=CGColorSpaceCreateDeviceRGB();
    //渐变的颜色值 RGB
    const CGFloat components[]={
      .3,.3,.3,.3,
      .7,.7,.7,.7,
       1,1,1,1,
    };
    //location
    const CGFloat locations[]={
        0,.3,1.0};
     //创建渐变对象
   CGGradientRef gradient=CGGradientCreateWithColorComponents(space,components,locations,3);
    
   //绘制渐变效果
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(90, 30), CGPointMake(110, 30), 0);
    //销毁颜色空间对象
    /***
     在coreFoundation框架中 creat创建的对象，在不使用的使用一定要销毁
     */
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
    
  //4.复原以前剪切区域
    CGContextRestoreGState(ctx);

}


@end
