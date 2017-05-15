//
//  MovieModel.h
//  WXMovie
//
//  Created by imac on 15/7/20.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
/*{

 "rating": {},
 "collect_count": 49,
 "images": {},
 "id": "3170961",
 "alt": "http://movie.douban.com/subject/3170961/",
 "title": "双枪",
 "subtype": "movie",
 "year": "2013",
 "original_title": "2 Guns"

 */
@property(nonatomic,retain)NSNumber *average;   //评分
@property(nonatomic,copy)NSString *title;   //标题
@property(nonatomic,copy)NSString *original_title;   //原标题
@property(nonatomic,copy)NSString *subtype;   //原标题
@property(nonatomic,copy)NSString *year;   //上映年份
@property(nonatomic,retain)NSDictionary *images;   //图片url
@property(nonatomic,copy)NSString *movieId;   //电影ID
@property(nonatomic,retain)NSNumber *collect_count; //收藏人数




@end
