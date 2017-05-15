//
//  PhotoViewController.m
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"

@interface PhotoViewController ()
{
    BOOL _ishidden; //导航栏的显示与隐藏
    PhotoCollectionView *collectionV;
}
@end

@implementation PhotoViewController

-(void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kImgClickNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationController.navigationBar.translucent = YES;
    
    _ishidden = YES;
    
//    返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
//    创建collectionview
    collectionV = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    //collectionV.backgroundColor= [UIColor redColor];
    [self.view addSubview:collectionV];
    
//    数据传递
    collectionV.urls = self.imageUrls;
    
//    滚动到指定的位置
    [collectionV scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    collectionV.firstRow = _indexPath.row;
    
//    创建单机手势，用于显示或隐藏导航栏
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
//    [self.view addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:kImgClickNotification object:nil];
    
}
/*
- (void)tapAction:(UITapGestureRecognizer *)tap{
    [self.navigationController setNavigationBarHidden:_ishidden animated:YES];
    _ishidden = !_ishidden;
}*/
//通知方法
- (void)notification:(NSNotification *)noti{
    [self.navigationController setNavigationBarHidden:_ishidden animated:YES];
    _ishidden = !_ishidden;
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat newVcH;
    CGFloat newVcW;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        // 横屏
        newVcH = [UIScreen mainScreen].bounds.size.width;
        newVcW = [UIScreen mainScreen].bounds.size.height;
    } else {
        // 竖屏
        newVcW = [UIScreen mainScreen].bounds.size.width ;
        newVcH = [UIScreen mainScreen].bounds.size.height;
    }
    
    self.view.frame = CGRectMake(0, 0, newVcW, newVcH);
    collectionV.orientation = self.interfaceOrientation;
//    [collectionV reloadData];
    
}

//- (void)setOrientation:(UIInterfaceOrientation)orientation {
//    
//    
//    collectionV.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    [collectionV reloadData];
//    //    [self setContentOffset:CGPointMake(self.currentIndex * kScreenWidth, 0)];
//    
//}

@end
