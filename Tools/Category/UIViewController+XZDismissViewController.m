//
//  UIViewController+XZDismissToRootViewController.m
//  闲职企业版
//
//  Created by 吴添培 on 2018/7/21.
//  Copyright © 2018年 xianzhiEnterprise. All rights reserved.
//

#import "UIViewController+XZDismissViewController.h"
#import "XZMainViewController.h"
#import <GKNavigationController.h>

@implementation UIViewController (XZDismissViewController)

- (void)dismissViewControllerClass:(Class)cls{
    UIViewController *vc = self;
    while (![vc isKindOfClass:cls] && vc != nil) {
        vc = vc.presentingViewController;
        if ([vc isKindOfClass:[XZMainViewController class]]) {
            vc = ((XZMainViewController *)vc).viewControllers.firstObject;
        }
        if ([vc isKindOfClass:[GKNavigationController class]]) {
            vc = ((GKNavigationController *)vc).gk_topViewController;
        }
        
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}

@end
