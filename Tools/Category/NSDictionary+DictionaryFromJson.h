//
//  NSDictionary+DictionaryFromJson.h
//  闲职
//
//  Created by 吴添培 on 2018/6/9.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DictionaryFromJson)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
