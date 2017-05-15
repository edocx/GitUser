//
//  PosterCell.h
//  WXMovie
//
//  Created by imac on 15/9/13.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;

@interface PosterCell : UICollectionViewCell

@property(nonatomic,retain)MovieModel *model; //电影数据


//翻转单元格
- (void)flipCell;
//复原cell
- (void)resetCell;

@end
