//
//  PosterView.m
//  WXMovie
//
//  Created by imac on 15/9/13.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#import "MovieModel.h"

#define kHeaderViewHeight 100   //头部视图的高度
#define kFooterViewHeight 40   //尾部视图的高度

@implementation PosterView
{
    UIControl *_maskView;  //遮盖视图
    IndexCollectionView *_indexCollectionV;
}

- (void)dealloc
{
    [_posterCollectionView removeObserver:self forKeyPath:@"currentIndex"];
    [_indexCollectionV removeObserver:self forKeyPath:@"currentIndex"];
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        //1.创建头部视图
        [self _creatHeaderView];
        
        //2.创建海报列表视图
        [self _createPosterCollectionView];
        //3.创建尾部视图
        [self _createFooterView];
        
        [_indexCollectionV addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:NULL];
        [_posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:NULL];
        
        
    }
    return self;
}
#pragma mark - KVO 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath //被观察属性名
                      ofObject:(id)object  //被观察对象
                        change:(NSDictionary *)change //属性值
                       context:(void *)context{
    
    NSLog(@"currentItem %@",keyPath);

    //取得变化之后的值
    NSInteger index = [[change objectForKey:@"new"] integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    //被观察对象是小图
    if ([object isKindOfClass:[IndexCollectionView class]] && _posterCollectionView.currentIndex != index) {
        if ([keyPath isEqualToString:@"currentIndex"]) {

            _posterCollectionView.currentIndex = index;
            [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            
            NSLog(@"%ld",_posterCollectionView.currentIndex);
        }
    }else if([object isKindOfClass:[PosterCollectionView class]] &&_indexCollectionV.currentIndex != index){  //被观察对象是大图
        
        if ([keyPath isEqualToString:@"currentIndex"]) {
            
            _indexCollectionV.currentIndex = index;
            [_indexCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    }
 
//    修改电影标题
    MovieModel *model = _data[index];
    _footerLabel.text = model.title;
    
}

//1.创建头部视图
- (void)_creatHeaderView{
    //...
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderViewHeight, kScreenWidth, 130)];
    _headerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerView];
    
    //2.创建背景视图
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    //设置拉伸点
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    imageV.image = image;
    [_headerView addSubview:imageV];
    
    //3.创建箭头按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake((_headerView.width - 20)/2, _headerView.height - 20, 20, 20)];
    [btn setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"up_home.png"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 100;
    [_headerView addSubview:btn];
    
    //4.创建向下轻扫的手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];

    //5.创建索引小图
    [self _creatHeaderIndexCollectionView];


}
- (void)_creatHeaderIndexCollectionView{
    _indexCollectionV = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, 100)];
    _indexCollectionV.pageWidth = 80;
    [_headerView addSubview:_indexCollectionV];
}
//2.创建海报列表视图
- (void)_createPosterCollectionView{
    
    _posterCollectionView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, self.height - kFooterViewHeight - 30)];
//    _posterCollectionView.backgroundColor = [UIColor greenColor];
    _posterCollectionView.pageWidth = 250;
    
    [self insertSubview:_posterCollectionView belowSubview:_headerView];
}
//3.创建尾部视图
-(void)_createFooterView{
    _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - kFooterViewHeight, kScreenWidth, kFooterViewHeight)];
    _footerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    _footerLabel.font = [UIFont systemFontOfSize:16];
    _footerLabel.textColor = [UIColor redColor];
    _footerLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_footerLabel];
    
    
}

- (void)setData:(NSArray *)data{
    _data = data;
    _posterCollectionView.data = _data;
    _indexCollectionV.data =_data;
    
    //显示第一个电影标题
    MovieModel *model = _data[0];
    _footerLabel.text = model.title;
    
}
#pragma mark - action  事件
//中间按钮的点击事件
- (void)btnAction:(UIButton *)btn{

    if (btn.selected == NO) {//展开显示
        
        [self _showHeaderView];
        
//        btn.selected = YES;
    }else{    //收起

        [self _hiddenHeaderView];
//        btn.selected = NO;
    }
//    btn.selected = !btn.selected;

}
//轻扫手势事件
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe{
    
    //只有笼罩视图是隐藏状态，下拉才显示头部视图
    if (_maskView.hidden == YES || _maskView == nil) {
        //展开显示头部视图
        [self _showHeaderView];
    }

}
//遮盖视图事件
- (void)maskAction:(UIControl *)ctrol{
    
    [self _hiddenHeaderView];
}
#pragma mark - 显示、隐藏事件
//展开显示头部视图
- (void)_showHeaderView{
    //1.显示头部视图
    [UIView animateWithDuration:.2 animations:^{
        _headerView.top = 0;
        
        //CGAffineTransformMakeTranslation : 总是在原始的transform上面移动x\y坐标
//        _headerView.transform = CGAffineTransformMakeTranslation(0, kHeaderViewHeight);

    }];
    
    //第一次下拉时创建遮盖视图
    if (_maskView == nil) {
        _maskView = [[UIControl alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headerView];
    }
    //2.更改button的selected状态
    UIButton *btn = (UIButton *)[_headerView viewWithTag:100];
    btn.selected = !btn.selected;
    
    //3.显示遮盖视图
    _maskView.hidden = NO;
    
    
}
//隐藏头部视图
- (void)_hiddenHeaderView{
    //1.隐藏
    [UIView animateWithDuration:.2 animations:^{
        _headerView.top = -kHeaderViewHeight;
//        _headerView.transform = CGAffineTransformIdentity;
    }];
    //2.更改button的selected状态
    UIButton *btn = (UIButton *)[_headerView viewWithTag:100];
    btn.selected = !btn.selected;
    //3.隐藏遮盖视图
    _maskView.hidden = YES;
}


@end
