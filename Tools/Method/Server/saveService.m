//
//  saveService.m
//  校园帮
//
//  Created by 吴添培 on 2017/7/4.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import "saveService.h"
#import "XZLoginUserModel.h"


@implementation saveService
//存储
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName
{
    // 有最新的版本号
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}
//读取
+ (nullable id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}


//MARK: - 获取登陆用户信息
+ (XZLoginUserModel *)getUserModel{
    return [XZLoginUserModel mj_objectWithKeyValues:[self objectForKey:loginUserDict]];;
}

+(NSString *)getUserIdByUserModel{
    if ([self getUserModel].ent_id == NULL) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",[self getUserModel].ent_id];
}

+(NSString *)getPhoneByUserModel{
    return [self getUserModel].ent_phone;
}

+(NSString *)getTokenByUserModel{
    return [self getUserModel].token;
}

+(NSString *)getNameByUserModel{
    return [self getUserModel].ent_name;
}

+(NSString *)getHeaderByUserModel{
    return [self getUserModel].ent_header;
}

@end
