//
//  IndexCollectionCell.m
//  WXMovie
//
//  Created by imac on 15/9/14.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "IndexCollectionCell.h"
#import "MovieModel.h"

@implementation IndexCollectionCell
{
    UIImageView *_imageV; //海报视图

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
    
    [self.contentView addSubview:_imageV];

}

- (void)setModel:(MovieModel *)model{
    _model = model;
    
    NSDictionary *images = _model.images;
    NSString *largeImage = images[@"large"];
    NSURL *url = [NSURL URLWithString:largeImage];
    
    [_imageV setImageWithURL:url];
    
}
@end
