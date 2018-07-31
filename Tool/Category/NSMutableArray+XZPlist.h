//
//  NSMutableArray+XZPlist.h
//  闲职
//
//  Created by MacBook Air on 2017/12/13.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (XZPlist)

+ (NSMutableArray *)arrayWithPlistFileResource:(NSString *)resource;

@end
