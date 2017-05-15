//
//  TopViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "TopViewController.h"
#import "MovieModel.h"
#import "TopCell.h"
#import "MovieDetailController.h"

@interface TopViewController ()
{
    NSMutableArray *_data; // 数据
}
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    //
    [self requestData];
    
}

- (void)requestData{
    
    _data = [NSMutableArray array];
    
    NSDictionary *jsonDic =[WXDataService requestData:@"top250"];
    
    NSArray *array = jsonDic[@"subjects"];
    
    for (NSDictionary *dic1 in array) {
        
        MovieModel *model = [[MovieModel alloc] init];
        model.title = dic1[@"title"];
        model.average = [[dic1 objectForKey:@"rating"] objectForKey:@"average"];
        model.collect_count = dic1[@"collect_count"];
        model.images = dic1[@"images"];
        model.movieId = dic1[@"id"];
        model.original_title = dic1[@"original_title"];
        model.subtype = dic1[@"subtype"];
        model.year = dic1[@"year"];
        
        [_data addObject:model];
    }
    [self.collectionV reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
    cell.model = _data[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    /**
     * 控制器加载view时，先用“MovieDetailViewController.xib”查找xib文件，如果没有再使用“MovieDetailView.xib” 查找xib文件，有的话加载此xib作为view的视图
     */
    MovieDetailController *detail = [[MovieDetailController alloc] init];
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
}

@end
