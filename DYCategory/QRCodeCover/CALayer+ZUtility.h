//
//  CALayer+ZUtility.h
//  05-二维码扫描
//
//  Created by Zed on 4/18/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (ZUtility)

/**
 *  向当前Layer上添加遮盖Layer层, 只留下指定Frame的矩形空间不遮盖
 *  @param rect 不遮盖矩形的Frame值
 */
- (void)coverButRect:(CGRect)rect;

@end
