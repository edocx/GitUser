//
//  WXTabbarItem.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "WXTabbarItem.h"

@implementation WXTabbarItem

- (id)initWithFrame:(CGRect)frame
      withImageName:(NSString *)imageName
          withTitle:(NSString *)title{
    
    self = [super initWithFrame:frame];
    if (self) {
        //1.创建图片视图
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 20)/2, 5, 20, 20)];
        //UIImageView的填充方式
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:imageName];
        imageV.image = image;
        //2.创建标题视图（UILabel）
        CGFloat height = CGRectGetMaxY(imageV.frame);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, 20)];
        label.text = title;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:imageV];
        [self addSubview:label];
        
    }
    return self;
    
}

@end
