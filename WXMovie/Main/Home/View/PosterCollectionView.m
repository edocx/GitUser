//
//  PosterCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/13.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"

@implementation PosterCollectionView
- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
   
        //注册单元格
        identify = @"PosterCell";
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
        
        //[被观察者  addObserver：观察者 参数：属性名 。。。]
//        [self addObserver:<#(NSObject *)#> forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>]
        
        
    }
    return self;
}



#pragma mark - UICollectionView DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.data[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //点击的是当前显示在最上面的单元格
    if (self.currentIndex == indexPath.item) {
        //根据indexPath查找单元格
        PosterCell *cell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        [cell flipCell];
        

    }else{  //点击两侧的单元格，则让该单元格显示在中间
        
        
        //翻转动画开启时，禁止单元格的选中事件
        collectionView.userInteractionEnabled = NO;
        
//        PosterCell *cell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
//        cell.selected = NO;
        //UICollectionViewScrollPositionCenteredHorizontally水平居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
      
        
        //设置当前显示的索引
        self.currentIndex = indexPath.item;
        
        
        //延迟动画时间，将可选事件打开
        [self performSelector:@selector(setuserEnable:) withObject:collectionView afterDelay:0.4];
    }
}

- (void)setuserEnable:(UICollectionView *)collectionView{
    
    collectionView.userInteractionEnabled = YES;
    
}
//当单元格被移除时，此协议方法被调用
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PosterCell *pCell = (PosterCell *)cell;
    
    
    [pCell resetCell];
    
    
}

@end
