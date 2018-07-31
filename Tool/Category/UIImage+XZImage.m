//
//  UIImage+XZImage.m
//  闲职
//
//  Created by MacBook Air on 2017/12/13.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import "UIImage+XZImage.h"

@implementation UIImage (XZImage)

+ (instancetype)imageWithOriginalImageName:(NSString *)imageName{
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextSetAlpha(context, alpha);//设置透明度
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)imageFromURLString:(NSString *)urlstring
{
    // This call is synchronous and blocking
    return [UIImage imageWithData:[NSData
                                   dataWithContentsOfURL:[NSURL URLWithString:urlstring]]];
}

@end
