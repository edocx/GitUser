//
//  PhotoViewCell.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class PhotoScrollView;
#import "PhotoScrollView.h"

@interface PhotoViewCell : UICollectionViewCell

@property(nonatomic,copy)NSString *urlString; //要显示的图片
@property(nonatomic,retain)PhotoScrollView *scrollView;

@end
