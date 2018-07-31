//
//  UIAlertController+Extention.m
//  闲职
//
//  Created by MacBook Air on 2017/12/6.
//  Copyright © 2017年 xianzhi. All rights reserved.
//【】p

#import "UIAlertController+Extention.h"

@implementation UIAlertController (Extention)

+(void)creatAlertControllerTitle:(NSString *_Nullable)title withMessage:(NSString *_Nullable)message addTarget:(id _Nullable )target callBack:(void(^_Nullable)(UIAlertAction * _Nonnull action))callBack{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(callBack){
            callBack(action);
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if(callBack){
            callBack(action);
        }
    }]];
    
    if ([target isKindOfClass:[UIView class]]) {
        [[target getViewControllerByView] presentViewController:alert animated:YES completion:nil];
    }
    else if ([target isKindOfClass:[UIViewController class]]){
        [target presentViewController:alert animated:YES completion:nil];
    }
}

+(void)creatcancelHomeAlertControllerTitle:(NSString *_Nullable)title withMessage:(NSString *_Nullable)message addTarget:(id _Nullable )target callBack:(void(^_Nullable)(UIAlertAction * _Nonnull action))callBack{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(callBack){
            callBack(action);
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(callBack){
            callBack(action);
        }
    }]];
    
    if ([target isKindOfClass:[UIView class]]) {
        [[target getViewControllerByView] presentViewController:alert animated:YES completion:nil];
    }
    else if ([target isKindOfClass:[UIViewController class]]){
        [target presentViewController:alert animated:YES completion:nil];
    }
}

+(void)creatAlertControllerWithTitle:(NSString *_Nullable)title addTarget:(id _Nullable )target{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
   
    if ([target isKindOfClass:[UIView class]]) {
         [[target getViewControllerByView] presentViewController:alert animated:YES completion:nil];
    }
    else if ([target isKindOfClass:[UIViewController class]]){
         [target presentViewController:alert animated:YES completion:nil];
    }
   
}

+(void)creatDidAlertControllerWithTitle:(NSString *_Nullable)title withMessage:(NSString *_Nullable)message addTarget:(id _Nullable )target callBack:(void(^_Nullable)(UIAlertAction * _Nonnull action))callBack{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        callBack(action);
    }]];
    
    if ([target isKindOfClass:[UIView class]]) {
        [[target getViewControllerByView] presentViewController:alert animated:YES completion:nil];
    }
    else if ([target isKindOfClass:[UIViewController class]]){
        [target presentViewController:alert animated:YES completion:nil];
    }
    
}


@end
