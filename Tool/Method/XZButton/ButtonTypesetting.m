//
//  ButtonTypesetting.m
//  毕业
//
//  Created by 吴添培的黑苹果 on 2017/10/13.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import "ButtonTypesetting.h"
#import "ButtonMenuItem.h"
#import "ButtonMenu.h"

@implementation ButtonTypesetting

//添加按钮
+ (CGFloat)GetTotolHeightAndAddBtnWithbuttonWH:(CGFloat)buttonWH Cloumn:(NSInteger)Cloumn array:(NSArray *)array target:(id)target action:(SEL)action{
    CGFloat margin = (SCREENWIDTH - Cloumn * buttonWH) / (Cloumn + 1);
    CGFloat x;
    CGFloat y;
    int curCloumn = 0;
    int curRow = 0;
    CGFloat totalHeight = 0.0;

    for(int i = 0 ;i < array.count; i++){
        //当前所在的列
        curCloumn = i % Cloumn;
        //当前所在的行
        curRow = i / Cloumn;
        UIButton *button = [[ButtonMenu alloc] init];
        x = margin + (buttonWH + margin) * curCloumn;
        y =(buttonWH + margin) * curRow;
        button.frame = CGRectMake(x, y, buttonWH, buttonWH);
        ButtonMenuItem *item = array[i];
        //设置按钮图片
        [button setImage:item.image forState:UIControlStateNormal];
        //设置按钮的文字
        [button setTitle:item.title forState:UIControlStateNormal];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [target addSubview:button];

        if (i == array.count - 1) {
            totalHeight = button.bottomY + 20;
        }
    }
    return totalHeight;
}


@end
