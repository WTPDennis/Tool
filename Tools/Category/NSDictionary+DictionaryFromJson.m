//
//  NSDictionary+DictionaryFromJson.m
//  闲职
//
//  Created by 吴添培 on 2018/6/9.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import "NSDictionary+DictionaryFromJson.h"

@implementation NSDictionary (DictionaryFromJson)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) return nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
