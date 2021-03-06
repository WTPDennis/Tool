//
//  NetworkTool.h
//  毕业设计
//
//  Created by 吴添培的黑苹果 on 2017/9/24.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "XZDataModel.h"

//枚举（get／post）
typedef enum
{
    GET,
    POST
    
}requestMethod;

@class XZUploadParam;
@interface NetworkTool : AFHTTPSessionManager

//单例
+(NetworkTool *)sharedInstance;

/**
 网络请求方法

 @param url urlString
 @param params 参数字典
 @param method 请求方法（GET/POST）
 @param callBack block 回调
 */
-(void)requestWithURLString:(NSString *)url
                     params:(NSDictionary *)params
                     method: (requestMethod)method
                   callBack: (void(^)(XZDataModel *dataModel, bool isSeccess))callBack;

-(void)requestNoLoadingWithURLString:(NSString *)urlString
                              params:(NSDictionary *)params
                              method:(requestMethod)method
                            callBack:(void (^)(XZDataModel *dataModel, bool isSeccess))callBack;

@end
