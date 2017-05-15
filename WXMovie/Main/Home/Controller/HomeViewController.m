//
//  HomeViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "HomeViewController.h"
#import "MovieModel.h"
#import "MovieCell.h"
#import "PosterView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor redColor];
    
    //1.初始化导航栏上的按钮
    [self _createNavigationView];
    //2.初始化列表视图
    [self _createTableView];
    //3.初始化海报视图
    [self _createPosterView];
    //4.请求数据
    [self _requestData];
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;

    /**
     *  automaticallyAdjustsScrollViewInsets
     *  YES : 当前控制器中有srollView对象，那么自动将此对象的偏移-64
     */
    //    self.automaticallyAdjustsScrollViewInsets = YES;
    
    /**
     * edgesForExtendedLayout  设置srollView对象 的延伸方向
     */
    //        self.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeBottom;
    
}
//4.请求数据
- (void)_requestData{
    //JSON数据解析工具： JSONKit\TouchJSON\SBJSON
    //Apple   NSJSONSerialization  ios5.0
     NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
     NSData *data = [NSData dataWithContentsOfFile:path];
     NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSArray *movieArray = [jsonDic objectForKey:@"subjects"];

    
//    NSLog(@"%@",jsonDic);
    _data = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in movieArray) {
        
        NSDictionary *dic1 = [dic objectForKey:@"subject"];
        
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
    
    [_tableV reloadData];
    
    //将数据传递给PosterView
    _posterV.data = _data;
    
}
//1.初始化导航栏上的按钮
- (void)_createNavigationView{
    //1.创建翻转的父视图
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    //2.创建右侧两个翻转按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    button1.tag = 200;
    button1.hidden = YES;
    button1.frame = buttonView.bounds;
    [button1 addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    button2.tag = 201;
    button2.hidden = NO;
    button2.frame = buttonView.bounds;
    [button2 addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button2];
    
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];
    
    self.navigationItem.rightBarButtonItem = barItem;
    
    
}
- (void)rightBarButtonAction:(UIButton *)btn{
    
    //    1.取得翻转的父视图
    //    UIView *bgView = self.navigationItem.rightBarButtonItem.customView;
    UIView *bgView =  btn.superview;
    UIButton *button1 = (UIButton *)[bgView viewWithTag:200];
    UIButton *button2 = (UIButton *)[bgView viewWithTag:201];
    
    //    2.按钮翻转
    button1.hidden = !button1.hidden;
    button2.hidden = !button2.hidden;
    [self flipView:bgView left:button1.hidden];
    
    //    3.切换列表视图与海报视图
    _tableV.hidden = !_tableV.hidden;
    _posterV.hidden = !_posterV.hidden;
    [self flipView:self.view left:button1.hidden];

    
    
}
- (void)flipView:(UIView *)forView left:(BOOL)flag{
    
    //翻转方向的设置
    UIViewAnimationOptions direction = flag ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:forView duration:.5 options:direction animations:^{
        
        [forView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}
//2.初始化列表视图
- (void)_createTableView{
    
    _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.hidden = YES;
    _tableV.rowHeight = 120; //设置行高
//    _tableV.separatorColor = [UIColor grayColor];
    [self.view addSubview:_tableV];
}
//3.初始化海报视图
- (void)_createPosterView{
    
    _posterV = [[PosterView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49)];
    _posterV.hidden = NO;
//    _posterV.backgroundColor = [UIColor redColor];
//    [self.view insertSubview:_posterV atIndex:0];
    [self.view addSubview:_posterV];
    
    
}

#pragma mark - UITableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _data.count;
//    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"MovieCell";
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil] lastObject];
    }
    cell.model = _data[indexPath.row];
    return cell;
}

@end
