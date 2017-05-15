//
//  LaunchViewController.m
//  WXMovie
//
//  Created by imac on 15/9/17.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()
{
    NSMutableArray *_imageArray;
    NSInteger _index;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景视图
    UIImageView *bgImageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgImageV.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:bgImageV];
    //加载所有的图片
    [self _loadImageArray];
    //开始动画
    [self _showAnimate];
    
}
- (void)_loadImageArray{
    
    CGFloat width = kScreenWidth / 4;
    CGFloat height = kScreenHeight / 6;
    
    CGFloat x = 0,y = 0;
    
    _imageArray = [NSMutableArray array];
    
    for (int i = 0; i < 16; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = image;
        imageV.alpha = 0;
        [self.view addSubview:imageV];
        [_imageArray addObject:imageV];
        
//        [self performSelector:@selector(addImage:) withObject:imageV afterDelay:1];
        
//    [NSThread sleepForTimeInterval:0.2];
        
        if (i <= 3) {
            y = 0;
            x = i * width;
        }else if (i <= 7 ){
            x = kScreenWidth - width;
            y = (i - 3) * height;
        }else if (i <= 11 ){
            y = kScreenHeight - height;
            x = kScreenWidth - (i - 7) * width;
        }else if (i <=16){
            x = 0;
            y = kScreenHeight - (i - 10) *height;
        }
        imageV.frame = CGRectMake(x, y, width, height);
        
    }
}

- (void)_showAnimate{
//    1.判断循环条件
    if (_index >= _imageArray.count) {
        [self showMain];
//        跳出递归
        return;
    }
    
    UIImageView *imageV = _imageArray[_index];
    
    [UIView animateWithDuration:0.2 animations:^{
        imageV.alpha = 1;
    }];

    
    //2.更新循环变量
    _index ++;
//    3.动画结束后，递归调用下一个
//    [self _showAnimate];
    [self performSelector:@selector(_showAnimate) withObject:nil afterDelay:0.2];
    
}

- (void)showMain{
    
    //1.加载storybaord
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //2.取得storybaord中第一个控制器对象
    UIViewController *viewcontroller = [storyboard instantiateInitialViewController];
    
    
    //3.取得Window对象
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    //self.view已经被添加到父视图上显示了，window属性是主Window对象
    UIWindow *window = self.view.window;
    window.rootViewController = viewcontroller;
    
    //设置动画
    viewcontroller.view.transform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView animateWithDuration:0.5 animations:^{
        viewcontroller.view.transform = CGAffineTransformIdentity;
    }];
    
    
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)addImage:(UIImageView *)imageV {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        [self.view addSubview:imageV];
        
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
