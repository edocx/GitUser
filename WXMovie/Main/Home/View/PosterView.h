//
//  PosterView.h
//  WXMovie
//
//  Created by imac on 15/9/13.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;

@interface PosterView : UIView
{
    //1.头部视图
    UIView *_headerView;
    
    //2.海报列表
    PosterCollectionView *_posterCollectionView;

    //3.尾部视图
    UILabel *_footerLabel;
}

@property(nonatomic,retain)NSArray *data;

@end
