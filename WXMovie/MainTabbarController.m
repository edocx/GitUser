//
//  MainTabbarController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MainTabbarController.h"
#import "WXTabbarItem.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.viewControllers;
    
    //     UI_APPEARANCE_SELECTOR   每一个导航栏都调用设置图片的方法

    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
//    [UIDevice currentDevice].systemVersion.floatValue
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self _creatTabbar];
}
- (void)_creatTabbar{
    //1.UITabBarButton 类按钮移除
    NSArray *arr = self.tabBar.subviews;
//    UITabBarButton
    //将字符串转化为类
    Class cla = NSClassFromString(@"UITabBarButton");
    for (UIView *view in arr) {
        //判断view是不是UITabBarButton类
        if ([view isKindOfClass:cla]) {
            [view removeFromSuperview];
        }
    }
    //2.设置背景图片
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    
    //4.设置选中视图
    _selected = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 45)];
    UIImage *image = [UIImage imageNamed:@"selectTabbar_bg_all"];
    _selected.image = image;
    [self.tabBar addSubview:_selected];
    
    
    //3.添加按钮
    NSArray *titleArray = @[@"北美榜",@"新闻",@"Top250",@"影院",@"更多"];
    NSArray *imageArray = @[@"movie_home",@"msg_new",@"start_top250",@"movie_cinema",@"more_setting"];
    
    
    //设置按钮的大小
    float width = kScreenWidth / titleArray.count;
    float height = CGRectGetHeight(self.tabBar.bounds);
    
    for (int i = 0; i < titleArray.count; i++) {
    
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setFrame:CGRectMake(i * width, 0, width, height)];
//        //设置标题
//        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
//        UIImage *image = [UIImage imageNamed:imageArray[i]];
//        //设置图片
//        [btn setImage:image forState:UIControlStateNormal];
//        [self.tabBar addSubview:btn];
//        // top   left  bottom  right
//        btn.titleEdgeInsets = UIEdgeInsetsMake(30, -18, 0, 0);
//        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
        
        
        WXTabbarItem *item = [[WXTabbarItem alloc] initWithFrame:CGRectMake(i * width, 0, width, height) withImageName:imageArray[i] withTitle:titleArray[i]];
        //添加点击事件
        [item addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//        根据tag值来确定是哪个选中
        item.tag = i;
        [self.tabBar addSubview:item];
        //第一次进入时选中首页
        if (i == 0) {
            _selected.center = item.center;
        }
        
    }
    


    
    
    
}
//点击切换选中的item  更改显示的视图控制器
- (void)click:(WXTabbarItem *)item{
    
    self.selectedIndex = item.tag;
    
    //动画显示选中的移动
    [UIView animateWithDuration:0.2 animations:^{
       
        _selected.center = item.center;

    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
