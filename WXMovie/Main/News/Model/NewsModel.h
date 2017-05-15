//
//  NewsModel.h
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/*{
 "id" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }*/

@property(nonatomic,retain)NSNumber *newsID;
@property(nonatomic,retain)NSNumber *type;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *image;

@end
