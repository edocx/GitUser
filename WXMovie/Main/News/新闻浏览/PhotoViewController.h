//
//  PhotoViewController.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController


@property(nonatomic,retain)NSArray *imageUrls; //要显示的图片URL数组
@property(nonatomic,retain)NSIndexPath *indexPath;  //开始显示的图片的indexPath

@end
