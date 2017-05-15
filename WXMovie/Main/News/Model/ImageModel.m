//
//  ImageModel.m
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
/*
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {

    //json数据 与 属性名的 映射关系
    //key: jsons数据的key名
    //value : 属性名
    NSDictionary *mapDic = @{
                                @"id":@"imageID",
                                @"image":@"image",
                                @"type":@"type"
                            };

    return mapDic;
}
*/
- (void)setAttributes:(NSDictionary *)jsonDic {
    
    [super setAttributes:jsonDic];
    
    self.imageID = [jsonDic objectForKey:@"id"];
    
}

@end
