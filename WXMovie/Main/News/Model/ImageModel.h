//
//  ImageModel.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface ImageModel : BaseModel
/*  {
 "id": 2238622,
 "image": "http://img31.mtime.cn/pi/2013/03/08/144644.81111130_1280X720.jpg",
 "type": 6
 },
 */


@property(nonatomic,retain)NSNumber *imageID;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,retain)NSNumber *type;


@end
