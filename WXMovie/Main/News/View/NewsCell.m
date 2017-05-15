//
//  NewsCell.m
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"

@implementation NewsCell

- (void)awakeFromNib {

    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];

}

- (void)setModel:(NewsModel *)model{
    _model = model;
    [self layoutIfNeeded];
//    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSString *imageStr = _model.image;
    NSURL *url = [NSURL URLWithString:imageStr];
    [_imageV setImageWithURL:url];
    
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.summary;
    
    //新闻类型
    NSInteger type = [self.model.type integerValue];

    if (type == 0) {//普通新闻
        _typeV.hidden = YES;
        _summaryLabel.left = _imageV.right + 5;
    }else if (type == 1){//图片新闻
        
        _typeV.hidden = NO;
        _typeV.image = [UIImage imageNamed:@"sctpxw"];
        _summaryLabel.left = _typeV.right + 5;

    }else if (type == 2){//视频新闻
        _typeV.hidden = NO;
        _typeV.image = [UIImage imageNamed:@"scspxw"];
        _summaryLabel.left = _typeV.right + 5;

    }
}

@end
