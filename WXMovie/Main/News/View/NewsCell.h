//
//  NewsCell.h
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;

@interface NewsCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageV;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_summaryLabel;
    __weak IBOutlet UIImageView *_typeV;
}
@property(nonatomic,retain)NewsModel *model;

@end
