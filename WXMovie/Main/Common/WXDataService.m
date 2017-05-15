//
//  WXDataService.m
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "WXDataService.h"

@implementation WXDataService

+ (id)requestData:(NSString *)fileName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    return jsonDic;
}
@end
