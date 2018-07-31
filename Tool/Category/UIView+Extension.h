//
//  UIView+SYWLExtension.h
//  毕业设计
//
//  Created by 吴添培 on 2017/6/26.
//  Copyright © 2017年 吴添培. All rights reserved.
///The stickers icon set or app icon set named "AppIcon" did not have any applicable content.

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;

@property (nonatomic, assign) CGFloat rightX;
@property (nonatomic, assign) CGFloat bottomY;


- (UIViewController *)getViewControllerByView;

@end
