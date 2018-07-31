//
//  UIFont+runtime.m
//  字体适配
//
//  Created by 吴添培 on 2018/1/9.
//  Copyright © 2018年 闲职. All rights reserved.
//
//class_getInstanceMethod得到类的实例方法
//class_getClassMethod得到类的类方法

#import "UIFont+runtime.h"
#import <objc/runtime.h>

//纯代码
@implementation UIFont (runtime)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取替换后的类方法
        Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
        // 获取替换前的类方法
        Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
        // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
        method_exchangeImplementations(newMethod, method);
    });
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    //newFont = [UIFont adjustFont:fontSize * myScreen];
    newFont = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize * myScale];
    return newFont;
}

@end

//xib 使用
@implementation UIButton (MyFont)
+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.titleLabel.tag != 333){
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize * myScale];
        }
    }
    return self;
}

@end


@implementation UILabel (myFont)
+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize * myScale];
        }
    }
    return self;
}

@end

@implementation UITextField (myFont)
+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize * myScale];
        }
    }
    return self;
}

@end

@implementation UITextView (myFont)
+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize * myScale];
        }
    }
    return self;
}

@end

