//
//  UIAlertController+Extention.h
//  闲职
//
//  Created by MacBook Air on 2017/12/6.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extention)

+(void)creatAlertControllerWithTitle:(NSString *_Nullable)title addTarget:(id _Nullable )target;

+(void)creatDidAlertControllerWithTitle:(NSString *_Nullable)title withMessage:(NSString *_Nullable)message addTarget:(id _Nullable )target callBack:(void(^_Nullable)(UIAlertAction * _Nonnull action))callBack;

+(void)creatAlertControllerTitle:(NSString *_Nullable)title withMessage:(NSString *_Nullable)message addTarget:(id _Nullable )target callBack:(void(^_Nullable)(UIAlertAction * _Nonnull action))callBack;

@end
