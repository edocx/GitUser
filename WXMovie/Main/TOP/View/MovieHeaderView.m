//
//  MovieHeaderView.m
//  WXMovie
//
//  Created by wei.chen on 14-1-21.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MovieHeaderView.h"
#import "UIImageView+WebCache.h"
#import "MovieDetailModel.h"
#import <QuartzCore/QuartzCore.h>

@implementation MovieHeaderView


- (void)awakeFromNib {
    [super awakeFromNib];
    
    //1.设置边框颜色
    imgView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    //2.设置边框的宽度
    imgView.layer.borderWidth = 1;
    //3.设置圆角半径
    imgView.layer.cornerRadius = 5.0;
    
    imgs = [[NSMutableArray alloc] init];
    CGFloat width =  (imgView.width-25)/ 4;
    CGFloat height = 70;
    for (int i=0; i<4; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(5+i*(width+5), 5, width, height)];
        image.backgroundColor = [UIColor grayColor];
        [imgView addSubview:image];
        [imgs addObject:image];;
    }
}

//- (void)setNeedsLayout;
//- (void)layoutIfNeeded;
//- (void)awakeFromNib
//- (void)layoutSubviews;

- (void)setMovieDetail:(MovieDetailModel *)movieDetail {
    if (_movieDetail != movieDetail) {
        _movieDetail = movieDetail;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSString *urlstring = self.movieDetail.image;
    [movieImg setImageWithURL:[NSURL URLWithString:urlstring]];
    
    titleLabel.text = self.movieDetail.titleCn;
    //导演
    NSString *directors = [self.movieDetail.directors componentsJoinedByString:@","];
    NSString *actors = [self.movieDetail.actors componentsJoinedByString:@","];
    NSString *types = [self.movieDetail.type componentsJoinedByString:@","];
    NSString *release = [[self.movieDetail.releaseLocation allValues] componentsJoinedByString:@" "];
    
    directorLabel.text = [NSString stringWithFormat:@"导演：%@",directors];
    actorLabel.text = [NSString stringWithFormat:@"演员：%@",actors];
    typeLabel.text = [NSString stringWithFormat:@"类型：%@",types];
    releaseLabel.text = release;
    
    for (int i=0; i<imgs.count; i++) {  //4
        UIImageView *image = imgs[i];
        
        if (i < self.movieDetail.images.count) {
            image.hidden = NO;
            NSString *urlstring = [self.movieDetail.images objectAtIndex:i];
            [image setImageWithURL:[NSURL URLWithString:urlstring]];
        } else {
            image.hidden = YES;
        }
        
    }
}


@end
