//
//  TopCell.m
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "TopCell.h"
#import "StarView.h"
#import "MovieModel.h"

@implementation TopCell
- (void)awakeFromNib{
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSString *str = [_model.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:str];
    [_imageV setImageWithURL:url];
    
    _titleLabel.text = _model.title;
    
    _ratingV.rating = [_model.average floatValue];
    
    _ratingLabel.text = [NSString stringWithFormat:@"%.2f",[_model.average floatValue]];
    
}

- (void)setModel:(MovieModel *)model{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];  //告诉系统去渲染界面
    }
}

@end
