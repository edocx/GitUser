//
//  BaseCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView


- (id)initWithFrame:(CGRect)frame{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置单元格之间的间隙
    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        //隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //        不能使用，宽度和cell的宽度不同
        //        self.pagingEnabled = YES;
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        
        
        //设置scrollview的减速快慢
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    //    self.contentInset = UIEdgeInsetsMake(0, 100, 0, 100);
    //    flowLayout.sectionInset = UIEdgeInsetsMake(0, 100, 0, 100);
    
    return self;
}



#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
//设置单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(_pageWidth, self.height);
}
//设置（第一个及最后一个）单元格偏移的位置
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, (self.width - _pageWidth)/2, 0, (self.width - _pageWidth)/2);
}

//结束拖拽时（手指离开屏幕）
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}
//
/**
 *  手指将要离开屏幕（停止拖拽）   设置减速模式decelerationRate
 *当 velocity 不为 CGPointZero 时，scroll view 会以 velocity 为初速度，减速直到 targetContentOffset。
 *  @param scrollView          <#scrollView description#>
 *  @param velocity            速度
 *  @param targetContentOffset 减速停止之后目标偏移量
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    //    targetContentOffset->x = 100;
    
//    NSLog(@"%f",velocity.x);
//    NSLog(@"当前偏移%f",scrollView.contentOffset.x);
//    NSLog(@"目标偏移%f",targetContentOffset->x);
    
    //    (100 + 125) / 250
    //  0-125    0
    //  126-275  1
    //  276-225  2
    
    //1.计算滑动停止之后，单元格的位置索引
    int index = (scrollView.contentOffset.x + _pageWidth/2) / _pageWidth;
    //    NSLog(@"%d",index);
    
    
    if (index == _currentIndex) {
        
        //        2.判断velocity滑动速度，速度快的话直接到下一页
        if (velocity.x > 0.4 && index < self.data.count-1) {
            index++;
        } else if(velocity.x < -0.4 && index > 0) {
            index--;
        }
    }
    
    //3.设置下一页的偏移量
    targetContentOffset->x = index*_pageWidth;
    //4.纪录当前显示页
    self.currentIndex = index;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //UICollectionViewScrollPositionCenteredHorizontally水平居中显示
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //设置当前显示的索引
    self.currentIndex = indexPath.item;
    
}
@end
