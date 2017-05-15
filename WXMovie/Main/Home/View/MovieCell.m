//
//  MovieCell.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MovieCell.h"
#import "MovieModel.h"
#import "StarView.h"

@implementation MovieCell

/**
 *  此对象如果是通过加载xib的方式创建的，那么创建的时候会调用此方法
 *  此方法类似于init方法
 */
- (void)awakeFromNib {
    
    self.backgroundColor = [UIColor clearColor];
    //选中效果
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
//布局子视图   ＋   填充数据
- (void)layoutSubviews{
    [super layoutSubviews];
    /*@property(nonatomic,retain)NSNumber *average;   //评分
     @property(nonatomic,copy)NSString *title;   //标题
     @property(nonatomic,copy)NSString *original_title;   //原标题
     @property(nonatomic,copy)NSString *subtype;   //原标题
     @property(nonatomic,copy)NSString *year;   //上映年份
     @property(nonatomic,retain)NSDictionary *images;   //图片url
     @property(nonatomic,copy)NSString *movieId;   //电影ID
     @property(nonatomic,retain)NSNumber *collect_count; //收藏人数*/
    _titleLabel.text = self.model.title;
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",self.model.year];
    _ratingLabel.text = [self.model.average stringValue];
    NSString *medium = [self.model.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:medium];
    [_imageView setImageWithURL:url];
    
    float score = [self.model.average floatValue];
    _starV.rating = score;
    
}

@end
