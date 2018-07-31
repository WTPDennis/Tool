//
//  NSMutableArray+XZPlist.m
//  闲职
//
//  Created by MacBook Air on 2017/12/13.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import "NSMutableArray+XZPlist.h"

@implementation NSMutableArray (XZPlist)

+ (NSMutableArray *)arrayWithPlistFileResource:(NSString *)resource{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:resource ofType:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    return array;
}

@end
