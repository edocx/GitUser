//
//  NewsViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "NewsViewController.h"
#import "StarView.h"
#import "WXDataService.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"
#import "ImageListViewController.h"

#define kImageViewHeight 150

@interface NewsViewController ()
{
    NSMutableArray *_data;
    UIImageView *_imageV;  // 头条视图
    UILabel *_titleLabel;
}
@end

@implementation NewsViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
     _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self _creatHeaderView];
    
    //1.请求数据
    [self _requestData];
    
    [self setHeaderViewData];
    
}
- (void)setHeaderViewData{
    
    NewsModel *model = _data[0];
    NSString *imageString = model.image;
    NSURL *url = [NSURL URLWithString:imageString];
    [_imageV setImageWithURL:url];
    
    _titleLabel.text = model.title;
    
}

- (void)_creatHeaderView{

    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kImageViewHeight)];
    _imageV.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:_imageV];
    
    [self.view insertSubview:_imageV belowSubview:_tableView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kImageViewHeight-30, kScreenWidth, 30)];
    _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor whiteColor];
    [self.view insertSubview:_titleLabel belowSubview:_tableView];
    
}


- (void)_requestData{
    
    NSArray *arr = [WXDataService requestData:@"news_list"];

    _data = [NSMutableArray arrayWithCapacity:arr.count];
    
    for (NSDictionary *dic in arr) {
        NewsModel *model = [[NewsModel alloc] init];
        model.title = dic[@"title"];
        model.image = dic[@"image"];
        model.type = dic[@"type"];
        model.newsID = dic[@"id"];
        model.summary = dic[@"summary"];
        
        [_data addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableView DataSource
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    
    return _data.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        /*
        UIImageView *imageV = (UIImageView *)[cell.contentView viewWithTag:300];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:301];
        NewsModel *model = _data[indexPath.row];
        
        NSURL *url = [NSURL URLWithString:model.image];
        [imageV setImageWithURL:url];
        label.text = model.title;
        label.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5]; */
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    cell.model = _data[indexPath.row + 1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = _data[indexPath.row+1];
    NSInteger type = [model.type integerValue];
    //判断新闻类型
    if (type == 0) {
        //这种创建方式不是通过加载storyboard中的控制器创建的
//        NewsDetailViewController *newsDetail = [[NewsDetailViewController alloc] init];
        
//        UIStoryboard
        
//通过加载storyboard中定义的控制器创建控制器对象
        NewsDetailViewController *newsDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
        newsDetail.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:newsDetail animated:YES];
        
    }else if (type == 1){
        
        ImageListViewController *imageList = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageListViewController"];
        imageList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:imageList animated:YES];
        
    }else if (type == 2){
        
        
        
    }
    NewsCell *cell = (NewsCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return kImageViewHeight;
    }
    return 60;
    
    
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 0) {  //向上滑动
        
        _imageV.top = -offsetY * 0.8;
        
    } else {
        
        //1.计算图片增大之后的高度
        //ABS 取绝对值
        CGFloat height = ABS(offsetY) + kImageViewHeight;
        
        //原宽度/原高度 = 放大宽度(?)/放大高度
        
        //2.计算图片增大之后的宽度
        CGFloat width = kScreenWidth/kImageViewHeight * height;
        
        //3.图片的x坐标向左偏移 增加宽度的一半
        CGRect frame = CGRectMake(-(width-kScreenWidth)/2, 0, width, height);
        
        _imageV.frame = frame;
    }
    
    _titleLabel.bottom = _imageV.bottom;
    
}

@end
