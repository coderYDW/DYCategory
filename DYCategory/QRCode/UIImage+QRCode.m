//
//  UIImage+QRCode.m
//  04-二维码的生成
//
//  Created by hm04 on 6/24/16.
//  Copyright © 2016 hm04. All rights reserved.
//

#import "UIImage+QRCode.h"

@implementation UIImage (QRCode)

- (UIImage *)QRCodeImageWithIcon:(UIImage *)icon
{
    // 1. 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 2. 画原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    // 3. 找个中间位置画图标
    // 假设icon的宽高是原图的0.2
    CGFloat wh = MIN(self.size.width, self.size.height) * 0.25;
    [icon drawInRect:CGRectMake((self.size.width - wh) * 0.5, (self.size.height - wh) * 0.5, wh, wh)];
    
    // 4. 取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
