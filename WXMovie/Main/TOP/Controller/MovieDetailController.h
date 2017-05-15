//
//  MovieDetailController.h
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "BaseViewController.h"

@interface MovieDetailController : BaseViewController<UITableViewDataSource,UITableViewDelegate> {
    
    UITableView *_tableView;
    NSInteger _selectedRow;

}
@property(nonatomic,retain)NSMutableArray *data;


@end
