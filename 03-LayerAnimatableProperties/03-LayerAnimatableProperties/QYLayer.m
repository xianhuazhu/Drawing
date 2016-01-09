//
//  QYLayer.m
//  03-LayerAnimatableProperties
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer

- (void)drawInContext:(CGContextRef)ctx {
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, 100);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    
    CGContextFillPath(ctx);
}

@end
