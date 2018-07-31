//
//  saveService.h
//  校园帮
//
//  Created by 吴添培 on 2017/7/4.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XZLoginUserModel;
@interface saveService : NSObject
//本地存储
+ (void)setObject:(nullable id)value forKey:(NSString *_Nullable)defaultName;

+ (nullable id)objectForKey:(NSString *_Nonnull)defaultName;

//获取登陆用户信息
+(NSString *)getUserIdByUserModel;

+(NSString *)getPhoneByUserModel;

+(NSString *)getTokenByUserModel;

+(NSString *)getNameByUserModel;

+(NSString *)getHeaderByUserModel;

@end
