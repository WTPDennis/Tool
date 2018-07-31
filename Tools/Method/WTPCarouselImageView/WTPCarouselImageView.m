//
//  Carousel.m
//  轮播器
//
//  Created by 吴添培的黑苹果 on 2017/9/26.
//  Copyright © 2017年 吴添培. All rights reserved.
//

#import "WTPCarouselImageView.h"
#import "WTPCarouselImageViewCell.h"


static NSString *ID = @"CarouselCell";

@interface WTPCarouselImageView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;

@property (nonatomic, copy) NSMutableArray *resultArray;

@end

@implementation WTPCarouselImageView

-(NSMutableArray *)resultArray{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _resultArray;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    [self collectionView];
    _timeInterval = 3;
    [self timer];
    
}

//MARK: - 传值
-(void)setImageArray:(NSArray *)imageArray{
    [self.resultArray removeAllObjects];
    [self.resultArray addObjectsFromArray:imageArray];
    [self.resultArray insertObject:[self.resultArray lastObject] atIndex:0];
    [self.resultArray insertObject:self.resultArray[1] atIndex:self.resultArray.count];
  
    [self pageControl];
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
}

-(void)setTimeInterval:(CGFloat)timeInterval{
    [self.timer invalidate];
    self.timer = nil;
    _timeInterval = timeInterval;
    [self timer];
    
}

//MARK: - 处理事件 时间事件
-(void)carouselPage{
    CGFloat offsetX = _collectionView.contentOffset.x;
    NSInteger number = offsetX / _collectionView.bounds.size.width;
    
    if (number == self.resultArray.count - 1) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:number + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

//MARK: - 懒加载
-(NSTimer *)timer{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(carouselPage) userInfo:nil repeats:YES];
        NSRunLoop * runLoop = [NSRunLoop  currentRunLoop];
        [runLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        NSInteger number = self.resultArray.count - 2;
        _pageControl.numberOfPages = number;
        CGSize pageControlSize = [_pageControl sizeForNumberOfPages:number];
        _pageControl.bounds = CGRectMake(0, 0, pageControlSize.width, pageControlSize.height);
        _pageControl.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.9);
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPage = 0;
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[WTPCarouselImageViewCell class] forCellWithReuseIdentifier:ID];
        collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        [self insertSubview:collectionView atIndex:0];
        
        self.collectionView = collectionView;
    }
    return _collectionView;
}

//MARK: - 拖拽
//scrollView即将开始拖拽时调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
    _timer = nil;
}
//结束拖拽时调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self timer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger number;
    if (offsetX == 0) {
        number = 0;
    }else if(offsetX < scrollView.frame.size.width){
        number = 1;
    }else{
        number = offsetX / scrollView.frame.size.width;
    }
    
    offsetX = offsetX + scrollView.frame.size.width * 0.5;
    NSInteger page = offsetX / scrollView.frame.size.width;
    if (page == 0) {
        page = self.resultArray.count - 2;
    }
    if (page == self.resultArray.count - 1) {
        page = 1;
    }
    _pageControl.currentPage = page - 1;
    
    if (number == 0) {
         [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.resultArray.count - 2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    else if (number == self.resultArray.count - 1) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}


//MARK: - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.resultArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WTPCarouselImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageString = self.resultArray[indexPath.row];
    return cell;
}

//MARK: - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(CarouselView:didSelectItemAtIndex:)]) {
        [_delegate CarouselView:self didSelectItemAtIndex:indexPath.row];
    }
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

@end
