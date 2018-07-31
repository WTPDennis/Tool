//
//  NetworkTool.m
//  毕业设计
//
//  Created by 吴添培的黑苹果 on 2017/9/24.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import "NetworkTool.h"
//#import "MBProgressHUD.h"

static NetworkTool *_instance = nil;

@implementation NetworkTool

//利用GCD方式创建单例，，避免在多线程中创建多个instance
//@synchronized(self) { }, 互斥锁效果一样 ，但是会影响性能
+(NetworkTool *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [NetworkTool manager];
        _instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        _instance.requestSerializer.timeoutInterval = 5.f;
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

-(void)requestWithURLString:(NSString *)urlString
                     params:(NSDictionary *)params
                     method:(requestMethod)method
                   callBack:(void (^)(XZDataModel *dataModel, bool isSeccess))callBack{
//     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
//     hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");

    if (method == GET) {
        //调用AFN框架的方法
        [_instance GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //如果请求成功，则回调responseObject
            XZDataModel *dataModel = [XZDataModel mj_objectWithKeyValues:responseObject];
            callBack(dataModel,YES);
            //[hud hideAnimated:YES];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            callBack(nil,NO);
           // [hud hideAnimated:YES];
        }];
    }
    
    if (method == POST) {
        [_instance POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            XZDataModel *dataModel = [XZDataModel mj_objectWithKeyValues:responseObject];
            callBack(dataModel,YES);
           // [hud hideAnimated:YES];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            callBack(nil,NO);
           // [hud hideAnimated:YES];
        }];
    }
}

@end
