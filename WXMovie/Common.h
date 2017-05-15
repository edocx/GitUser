//
//  Common.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#ifndef WXMovie_Common_h
#define WXMovie_Common_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "UIImageView+WebCache.h"  //网络加载图片
#import "UIViewExt.h"    //UIView扩展方法
#import "WXDataService.h"    //数据加载

#define us_box    @"us_box"     //北美榜
#define news_list @"news_list"  //新闻列表
#define news_detail @"news_detail" //新闻详情
#define image_list  @"image_list"   //新闻图片列表
#define top250      @"top250"     //top250电影列表
#define movie_detail @"movie_detail"   //电影详细信息
#define movie_comment @"movie_comment"  //评论列表
#define cinema_detail @"cinema_detail"  //影院详情
#define cinema_list @"cinema_list"  //影院详情
#define district_list @"district_list"  //



#define kImgClickNotification @"ImgClickNotification"


#endif
