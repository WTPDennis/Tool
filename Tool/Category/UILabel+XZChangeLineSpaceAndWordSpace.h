//
//  UILabel+XZChangeLineSpaceAndWordSpace.h
//  闲职
//
//  Created by 吴添培 on 2018/3/31.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XZChangeLineSpaceAndWordSpace)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
