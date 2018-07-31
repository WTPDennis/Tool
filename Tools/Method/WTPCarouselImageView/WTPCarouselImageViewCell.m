//
//  CollectionViewCell.m
//  测试轮播器
//
//  Created by 吴添培 on 2017/6/27.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import "WTPCarouselImageViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface WTPCarouselImageViewCell ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation WTPCarouselImageViewCell

-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

-(void)setImageString:(NSString *)imageString{
    _imageString = imageString;
    
    if([imageString rangeOfString:@"http://p71z32jsk.bkt.clouddn.com"].location != NSNotFound){
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:[UIImage imageNamed:@"Mine_topBackGround"]];
    }
    else{
        self.imageView.image = [UIImage imageNamed:imageString];
    }
    
}

@end
