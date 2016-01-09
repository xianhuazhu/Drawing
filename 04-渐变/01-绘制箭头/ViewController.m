//
//  ViewController.m
//  01-绘制箭头
//
//  Created by qingyun on 16/1/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYview.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet QYview *myView;
@end

@implementation ViewController

- (IBAction)startAction:(UIButton *)sender {
   // NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:.02 target:_myView selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
//    
//    CADisplayLink  *displayLink=[CADisplayLink displayLinkWithTarget:_myView selector:@selector(setNeedsDisplay)];
//    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//
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
