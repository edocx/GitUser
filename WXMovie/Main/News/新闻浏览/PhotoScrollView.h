//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
}

@property(nonatomic,retain)NSURL *url;
@property(nonatomic,retain)UIImageView *imageView;


@end
