//
//  ImageListViewController.h
//  WXMovie
//
//  Created by imac on 15/9/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ImageListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    __weak IBOutlet UICollectionView *_collectionV;
}
@end
