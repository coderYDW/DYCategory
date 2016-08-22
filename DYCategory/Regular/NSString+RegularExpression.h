//
//  NSString+RegularExpression.h
//  01-正则表达式的基本使用
//
//  Created by hm04 on 6/24/16.
//  Copyright © 2016 hm04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)

/*
 *  检测是否匹配
 */
- (BOOL)matchWithPattern:(NSString *)pattern;

/**
 *  返回第一个匹配结果的范围
 */
- (NSRange)firstRangeMatchWithPattern:(NSString *)pattern;

/**
 *  返回保存了所有匹配结果范围的数组, 如果匹配失败则返回nil
 */
- (NSArray <NSValue *> *)matchesRangeWithPattern:(NSString *)pattern;

/**
 *  返回第一个匹配结果的字符串
 */
- (NSString *)firstStringMatchWithPattern:(NSString *)pattern;

/**
 *  返回保存了所有匹配字符串结果的数组, 如果匹配失败则返回nil
 */
- (NSArray <NSString *> *)matchesStringWithPattern:(NSString *)pattern;

@end
