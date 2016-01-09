//
//  QYLayer.m
//  01-DemoLayer
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer

- (void)drawInContext:(CGContextRef)ctx {
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 200, 100));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    
    CGContextFillPath(ctx);
}

@end
