//
//  NSString+Path.h
//  07-加载网络图片
//
//  Created by pkxing on 15/10/21.
//  Copyright © 2015年 梦醒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)
/**
 *  添加document路径
 */
- (NSString *)appendDocumentPath;
/**
 *  添加cache路径
 */
- (NSString *)appendCachePath;
/**
 *  添加temp路径
 */
- (NSString *)appendTempPath;
@end
