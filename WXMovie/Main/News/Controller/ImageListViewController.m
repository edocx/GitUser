//
//  ImageListViewController.m
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ImageListViewController.h"
#import "ImageModel.h"
#import "PhotoViewController.h"
#import "BaseNavigationController.h"

@interface ImageListViewController ()
{
    NSMutableArray *_data;
}
@end

@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.加载数据
    [self requestData];
}

- (void)requestData{
    
    NSArray *imageArr = [WXDataService requestData:image_list];
    
    _data = [NSMutableArray arrayWithCapacity:imageArr.count];
    
    for (NSDictionary *dic in imageArr) {
        
        ImageModel *model = [[ImageModel alloc] initContentWithDic:dic];
//        model.imageID = dic[@"id"];
//        model.image = dic[@"image"];
//        model.type = dic[@"type"];
        
        [_data addObject:model];
    }
    
    [_collectionV reloadData];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    UIImageView *imageV = (UIImageView *)[cell.contentView viewWithTag:200];
    ImageModel *model = [_data objectAtIndex:indexPath.item];
    [imageV setImageWithURL:[NSURL URLWithString:model.image]];
    
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    
    //取出所有的model内的url
    NSMutableArray *urls = [NSMutableArray arrayWithCapacity:_data.count];
    for (ImageModel *model in _data) {
        NSString *urlStr = model.image;
        [urls addObject:urlStr];
    }
    
    //传递总共的图片列表
    photoVC.imageUrls = urls;
    
    photoVC.indexPath = indexPath;
    
    BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:photoVC];
    //通过模态效果弹出控制器，此控制器视图是直接被添加到window中，是没有父控制器的
    [self presentViewController:navi animated:YES completion:nil];
    
}

@end
