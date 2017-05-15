//
//  IndexCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/14.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionCell.h"

@implementation IndexCollectionView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        //注册单元格
        identify = @"IndexCollectionCell";
        [self registerClass:[IndexCollectionCell class] forCellWithReuseIdentifier:identify];
        
    }

    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.data[indexPath.item];
    return cell;
}
@end
