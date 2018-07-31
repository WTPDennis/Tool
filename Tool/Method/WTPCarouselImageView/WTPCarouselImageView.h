//
//  Carousel.h
//  轮播器
//
//  Created by 吴添培的黑苹果 on 2017/9/26.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTPCarouselImageView;
@protocol WTPCarouselImageViewDelegate <NSObject>

@optional
- (void)CarouselView:(WTPCarouselImageView *)carouselView didSelectItemAtIndex:(NSInteger)index;

@end

@interface WTPCarouselImageView : UIView

@property (nonatomic, copy) NSArray *imageArray;
@property (nonatomic, assign) CGFloat timeInterval;

@property (nonatomic, weak) id<WTPCarouselImageViewDelegate> delegate;

@end
