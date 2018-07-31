//
//  UIImage+XZImage.h
//  闲职
//
//  Created by MacBook Air on 2017/12/13.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZImage)
//原始图片
+ (instancetype)imageWithOriginalImageName:(NSString *)imageName;

//以颜色来绘制图片
+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha;

+ (UIImage *)imageFromURLString:(NSString *)urlstring;

@end
