//
//  ViewController.m
//  01-CoreAnimationDemo
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *ctmView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"<<<%@", [_ctmView.layer actionForKey:@"backgroundColor"]);
    
    [UIView beginAnimations:nil context:nil];
    
    NSLog(@">>>%@", [_ctmView.layer actionForKey:@"backgroundColor"]);
    
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
