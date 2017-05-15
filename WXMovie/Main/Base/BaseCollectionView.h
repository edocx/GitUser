//
//  BaseCollectionView.h
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSString *identify;
}

@property(nonatomic,assign)CGFloat pageWidth; //每页的宽度
@property(nonatomic,retain)NSArray *data; //要显示的数据

@property(nonatomic,assign)NSInteger currentIndex; // 当前显示的页数

@end
