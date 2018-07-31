//
//  ButtonTypesetting.h
//  毕业
//
//  Created by 吴添培的黑苹果 on 2017/10/13.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonTypesetting : UIButton

+ (CGFloat)GetTotolHeightAndAddBtnWithbuttonWH:(CGFloat)buttonWH Cloumn:(NSInteger)Cloumn array:(NSArray *)array target:(id)target action:(SEL)action;

@end
