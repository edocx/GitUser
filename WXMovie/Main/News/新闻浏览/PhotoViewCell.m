//
//  PhotoViewCell.m
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PhotoViewCell.h"
//#import "PhotoScrollView.h"

@implementation PhotoViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatScrollView];
    }
    return self;
}
- (void)awakeFromNib{
    
    [self creatScrollView];
}

- (void)creatScrollView{
    _scrollView = [[PhotoScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:_scrollView];
}

- (void)setUrlString:(NSString *)urlString{
//    _urlString = urlString;
    _scrollView.url = [NSURL URLWithString:urlString];
}

@end
