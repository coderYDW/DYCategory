//
//  NSString+RegularExpression.m
//  01-正则表达式的基本使用
//
//  Created by DovYoung on 6/24/16.
//  Copyright © 2016 DovYoung. All rights reserved.
//

#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)

/**
 *  返回判断是否成功
 */
- (BOOL)matchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return NO;
    }
    
    return YES;
}

/**
 *  返回第一个匹配的范围
 */
- (NSRange)firstRangeMatchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return NSMakeRange(0, 0);
    }
    
    return result.range;
}
/**
 *  返回第一个匹配的字符串
 */
- (NSString *)firstStringMatchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return nil;
    }
    
    return [self substringWithRange:result.range];
}
/**
 *  返回全部的正则匹配的范围,存的是Value,通过value.range得到range值
 */
- (NSArray<NSValue *> *)matchesRangeWithPattern:(NSString *)pattern
{
    NSArray <NSTextCheckingResult *> *resultArray = [self privateMatchesWithPattern:pattern];

    
    if (resultArray.count == 0) {
        return nil;
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArray) {
        [tempArray addObject:[NSValue valueWithRange:result.range]];
    }
    
    return [tempArray copy];
}


/**
 *  返回全部的正则匹配的字符串
 */
- (NSArray<NSString *> *)matchesStringWithPattern:(NSString *)pattern
{
    NSArray <NSTextCheckingResult *> *resultArray = [self privateMatchesWithPattern:pattern];
    
    if (resultArray.count == 0) {
        return nil;
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArray) {
        NSString *subString = [self substringWithRange:result.range];
        [tempArray addObject:subString];
    }
    
    return [tempArray copy];
}

#pragma mark - Private
/**
 *  根据正则返回第一个检测结果,结果里面有范围和类型
 */
- (NSTextCheckingResult *)privateFirstMatchesWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return nil;
    }
    
    NSTextCheckingResult *result = [expression firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return result;
}
/**
 *  根据正则返回全部检测结果,结果里面有范围和类型
 */
- (NSArray <NSTextCheckingResult *> *)privateMatchesWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return nil;
    }
    
    NSArray <NSTextCheckingResult *> *resultArray = [expression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return resultArray;
}

@end
