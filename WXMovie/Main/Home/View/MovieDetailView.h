//
//  MovieDetailView.h
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class MovieModel;

@interface MovieDetailView : UIView
{
    __weak IBOutlet UIImageView *_imageV;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_sourceLabel;
    __weak IBOutlet UILabel *_yearLabel;
    __weak IBOutlet StarView *_ratingV;
    __weak IBOutlet UILabel *_ratingLabel;
    
}
@property(nonatomic,retain)MovieModel *model;
@end
