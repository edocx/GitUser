//
//  PosterCell.m
//  WXMovie
//
//  Created by imac on 15/9/13.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PosterCell.h"
#import "MovieModel.h"
#import "MovieDetailView.h"

@implementation PosterCell
{
    UIImageView *_imageV; //海报视图
    MovieDetailView *_detailView; //详情视图
    
    BOOL isLeft;  //翻转方向
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews{
    
    //1.创建海报视图
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 10)];
    NSLog(@"%@",_imageV);
    [self.contentView addSubview:_imageV];
    //2.创建详情视图
//    _detailView = [[[NSBundle mainBundle] loadNibNamed:@"MovieDetailView" owner:self options:nil] lastObject];
    _detailView = [[[NSBundle mainBundle] loadNibNamed:@"MovieDetailView" owner:self options:nil] lastObject];
    _detailView.frame = _imageV.frame;
    _detailView.backgroundColor = [UIColor blueColor];
    [self.contentView insertSubview:_detailView belowSubview:_imageV];
}

- (void)setModel:(MovieModel *)model{
    _model = model;
    
    NSDictionary *images = _model.images;
    NSString *largeImage = images[@"large"];
    NSURL *url = [NSURL URLWithString:largeImage];
    
    [_imageV setImageWithURL:url];
    
    _detailView.model = _model;
}

//翻转单元格
- (void)flipCell{
    //查找出两个子视图的索引
    NSInteger first= [self.contentView.subviews indexOfObject:_imageV];
    NSInteger second= [self.contentView.subviews indexOfObject:_detailView];
    
    UIViewAnimationOptions left = isLeft ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
//进行翻转
    [UIView transitionWithView:self.contentView duration:0.4 options:left animations:^{
        [self.contentView exchangeSubviewAtIndex:first withSubviewAtIndex:second];
        
    } completion:^(BOOL finished) {
        isLeft = !isLeft;
    }];
    
    
    
}
- (void)resetCell{
    
    [self.contentView bringSubviewToFront:_imageV];
}

@end
