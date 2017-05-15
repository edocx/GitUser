//
//  MovieDetailView.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MovieDetailView.h"
#import "StarView.h"
#import "MovieModel.h"

@implementation MovieDetailView
-(void)setModel:(MovieModel *)model{
    
        _model = model;
        
    [self setNeedsLayout];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSURL *url = [NSURL URLWithString:[_model.images objectForKey:@"small"]];
    [_imageV setImageWithURL:url];
    
    _titleLabel.text = [NSString stringWithFormat:@"标题：%@",_model.title];
    _ratingV.rating = [_model.average floatValue];
    _sourceLabel.text = [NSString stringWithFormat:@"原标题：%@",_model.original_title];
    _ratingLabel.text = [_model.average stringValue];
    _yearLabel.text = [NSString stringWithFormat:@"上映年份：%@",_model.year];
    
}

@end
