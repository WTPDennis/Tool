//
//  XZAES128.h
//  AES128
//
//  Created by 吴添培 on 2018/4/2.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define xianzhiappkey @"xianzhiappkey918"

@interface XZAES128 : NSObject

+(NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key;

+(NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key;  

@end
