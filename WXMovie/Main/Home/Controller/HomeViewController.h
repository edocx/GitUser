//
//  HomeViewController.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class PosterView;

@interface HomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableV;   //列表视图
    PosterView *_posterV;       //海报视图
    
     NSMutableArray *_data; //电影数据
}

@end
