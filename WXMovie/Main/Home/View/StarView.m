//
//  StarView.m
//  WXMovie
//
//  Created by imac on 15/7/21.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createSubViews];
        
    }
    return self;
}

-(void)awakeFromNib{
    
    [self _createSubViews];
    
}

//创建子视图
- (void)_createSubViews{
    
    self.backgroundColor = [UIColor clearColor];
    
    //1.创建灰色星星
    UIImage *gray = [UIImage imageNamed:@"gray"];
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, gray.size.width * 5, gray.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:gray];
    [self addSubview:_grayView];
    //2.创建金色星星
    UIImage *yellow = [UIImage imageNamed:@"yellow"];
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellow.size.width * 5, yellow.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellow];
    [self addSubview:_yellowView];
    
    //3.设置当前视图的宽度为5个星星的宽度
    CGFloat star5Width = self.frame.size.width * 5;
    CGRect frame = self.frame;
    frame.size.width = star5Width;
    self.frame = frame;

//    self.width = star5Width;
    
    //4.放大星星
    CGFloat scale = self.frame.size.height / gray.size.height;
    CGAffineTransform t =CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = t;
    _yellowView.transform = t;
    
    CGRect f1 = _yellowView.frame;
    CGRect f2 = _grayView.frame;
    f1.origin = CGPointZero;
    f2.origin = CGPointZero;
    _yellowView.frame = f1;
    _grayView.frame = f2;
    
    
}

- (void)setRating:(float)rating{
    
    _rating = rating;
    //计算分数的百分比
    float ra = _rating / 10.0;
    CGFloat width = _grayView.frame.size.width * ra;
    
    CGRect f1 = _yellowView.frame;
    f1.size.width = width;
    _yellowView.frame = f1;
    
//    _yellowView.width = width;
    
}


@end
