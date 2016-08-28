//
//  NSString+Path.m
//  07-加载网络图片
//
//  Created by pkxing on 15/10/21.
//  Copyright © 2015年 梦醒. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)
- (NSString *)appendDocumentPath {
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendCachePath {
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendTempPath {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}
@end
