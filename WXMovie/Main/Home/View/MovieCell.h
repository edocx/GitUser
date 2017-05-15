//
//  MovieCell.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@class StarView;

@interface MovieCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageView;
    


    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_ratingLabel;

    
    __weak IBOutlet UILabel *_yearLabel;

    __weak IBOutlet StarView *_starV;
    
}
@property(nonatomic,retain)MovieModel *model;
@end
