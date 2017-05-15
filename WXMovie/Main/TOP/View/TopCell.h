//
//  TopCell.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class MovieModel;

@interface TopCell : UICollectionViewCell
{
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UIImageView *_imageV;
    
    __weak IBOutlet StarView *_ratingV;
    
    __weak IBOutlet UILabel *_ratingLabel;
    
}

@property(nonatomic,retain)MovieModel *model;

@end
