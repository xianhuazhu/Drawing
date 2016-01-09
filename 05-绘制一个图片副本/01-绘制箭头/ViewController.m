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

- (IBAction)startAction:(UIButton *)sender {
   //1.绘制图片
    UIImage *image=[UIImage imageNamed:@"dorayo.jpeg"];
   
    //1.创建位图上下文
    /* 
     * size 绘制图片的大小
     * opaque 透明 Yes不透明，NO，透明
     * scale 绘制图片的比例 1
     */
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), YES, 1);
#if 0
     /* 坐标系统
     * 左上（0，0)
     */
    [image drawInRect:CGRectMake(0,0, 200, 200)];
#endif
    
    /**坐标系统
     * 左下
     */
    //获取当前图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
 
#if 0
    //翻转Y轴
    CGContextScaleCTM(ctx, 1, -1);
    //平移Y -200；
    CGContextTranslateCTM(ctx, 0, -200);
#endif
    //翻转X轴
    //1.旋转180
    CGContextRotateCTM(ctx, M_PI);
    //2.翻转x轴
    CGContextScaleCTM(ctx, -1, 1);
    //3.平移Y轴 -200
    CGContextTranslateCTM(ctx, 0, -200);
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, 200, 200), image.CGImage);
   
    //从当前上下文获取图片
     UIImage *image1=UIGraphicsGetImageFromCurrentImageContext();

    //创建uiiamgeview 添加到当前视图
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 200, 200)];
    imageView.image=image1;
    [self.view addSubview:imageView];
    
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
