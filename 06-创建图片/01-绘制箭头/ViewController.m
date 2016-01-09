//
//  ViewController.m
//  01-绘制箭头
//
//  Created by qingyun on 16/1/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController


-(void)drawFace:(CGContextRef)ctx{
    [[UIColor purpleColor]setFill];
    CGContextAddEllipseInRect(ctx, CGRectMake(40, 40, 120, 160));
    CGContextFillPath(ctx);
}

-(void)drawEyes:(CGContextRef )ctx withRect:(CGRect)rect{
    [[UIColor blackColor] setFill];
    CGContextAddEllipseInRect(ctx, rect);
    CGContextFillPath(ctx);
}

-(void)drawNose:(CGContextRef)ctx{
    CGContextMoveToPoint(ctx, 100, 140);
    const CGPoint points[]={100,100,80,120,120,120};
    CGContextAddLines(ctx, points, 3);
    CGContextFillPath(ctx);
}
-(void)drawMouth:(CGContextRef)ctx {
    [[UIColor redColor] setFill];
    CGContextAddRect(ctx,CGRectMake(65,150, 70, 20));
    CGContextFillPath(ctx);
}

- (IBAction)startAction:(UIButton *)sender {
   //1.创建上下文
    CGSize size=CGSizeMake(200, 200);
    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
   //2.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    //3.绘制图片
    [self drawFace:ctx];
   
    [self drawEyes:ctx withRect:CGRectMake(70, 60, 20, 20)];
    [self drawEyes:ctx withRect:CGRectMake(110, 60, 20, 20)];
  
    [self drawNose:ctx];
    [self drawMouth:ctx];
    
    //4.从当前上下文获取图片
    UIImage *temimage=UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    //6.图片存入本地
    NSData *data=UIImageJPEGRepresentation(temimage, 1);
    [data writeToFile:@"/Users/qingyun/Desktop/face.jpg" atomically:YES];
    
    UIImageView *iconImage=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    iconImage.image=temimage;
    [self.view addSubview:iconImage];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
