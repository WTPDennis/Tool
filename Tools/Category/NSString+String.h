//
//  NSString+String.h
//  闲职
//
//  Created by MacBook Air on 2017/12/8.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (String)
//正则表达式，判断字符串是否是数字和字母的集合，并且是0-16位
- (BOOL)deptNumInputShouldNumberAndString;
//获取网络请求url
+ (instancetype)getUrlString:(NSString *)urlString;
+(instancetype)getWalletUrlString:(NSString *)urlString;
//base64编码
+ (NSString *)Base64Encode:(NSString *)string;
//base64解码
+ (NSString *)Base64Dencode:(NSString *)base64String;
//判断是否有emoji
+ (BOOL)stringContainsEmoji:(NSString *)string;
//获取设备IP地址
+ (NSString *)getDeviceIPIpAddresses;
//获取时间戳
+(NSString *)getNowTimeTimestamp;
//判断身份证是否合法
+ (BOOL)checkUserID:(NSString *)userID;

@end
