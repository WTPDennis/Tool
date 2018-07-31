//
//  UIColor+ColorChange.h
//  闲职
//
//  Created by MacBook Air on 2017/12/4.
//  Copyright © 2017年 xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorChange)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)colorStr;

@end
