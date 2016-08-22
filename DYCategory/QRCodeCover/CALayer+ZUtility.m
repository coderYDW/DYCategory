//
//  CALayer+ZUtility.m
//  05-二维码扫描
//
//  Created by Zed on 4/18/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "CALayer+ZUtility.h"
#import <UIKit/UIKit.h>

@implementation CALayer (ZUtility)

- (void)coverButRect:(CGRect)rect
{
    // Rect为保留的矩形frame值
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat leftWidth = (screenWidth - rect.size.width) / 2;
    
    CAShapeLayer* layerTop   = [[CAShapeLayer alloc] init];
    layerTop.fillColor       = [UIColor blackColor].CGColor;
    layerTop.opacity         = 0.5;
    layerTop.path            = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, screenWidth, rect.origin.y)].CGPath;
    [self addSublayer:layerTop];
    
    CAShapeLayer* layerLeft   = [[CAShapeLayer alloc] init];
    layerLeft.fillColor       = [UIColor blackColor].CGColor;
    layerLeft.opacity         = 0.5;
    layerLeft.path            = [UIBezierPath bezierPathWithRect:CGRectMake(0, rect.origin.y, leftWidth, rect.size.height)].CGPath;
    [self addSublayer:layerLeft];
    
    CAShapeLayer* layerRight   = [[CAShapeLayer alloc] init];
    layerRight.fillColor       = [UIColor blackColor].CGColor;
    layerRight.opacity         = 0.5;
    layerRight.path            = [UIBezierPath bezierPathWithRect:CGRectMake(screenWidth - leftWidth, rect.origin.y, rect.size.width, rect.size.height)].CGPath;
    [self addSublayer:layerRight];
    
    CAShapeLayer* layerBottom   = [[CAShapeLayer alloc] init];
    layerBottom.fillColor       = [UIColor blackColor].CGColor;
    layerBottom.opacity         = 0.5;
    layerBottom.path            = [UIBezierPath bezierPathWithRect:CGRectMake(0, CGRectGetMaxY(rect), screenWidth, screenHeight - CGRectGetMaxY(rect))].CGPath;
    [self addSublayer:layerBottom];
}

@end
