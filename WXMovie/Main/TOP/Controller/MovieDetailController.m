//
//  MovieDetailController.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MovieDetailController.h"
#import "CommentModel.h"
#import "MovieDetailModel.h"
#import "MovieHeaderView.h"
#import "CommentCell.h"

@interface MovieDetailController ()
{
    NSString *identify;
}
@end

@implementation MovieDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    
    _selectedRow = -1;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
    
    identify = @"CommentCell";
    UINib *nib = [UINib nibWithNibName:@"CommentCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:identify];
    
    //加载电影详情数据
    [self loadMovieDetailData];
    //加载评论列表数据
    [self loadCommentData];
}
//1.加载电影详情数据
- (void)loadMovieDetailData {
    
    NSDictionary *jsonData = [WXDataService requestData:movie_detail];
    MovieDetailModel *movieDetail = [[MovieDetailModel alloc] initContentWithDic:jsonData];
    
    //刷新视图
    MovieHeaderView *movieHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MovieHeaderView" owner:nil options:nil] lastObject];
    movieHeaderView.movieDetail = movieDetail;
    _tableView.tableHeaderView = movieHeaderView;
    
}

//2.加载评论列表数据
- (void)loadCommentData {
    
    NSDictionary *jsonData = [WXDataService requestData:movie_comment];
    NSArray *list = [jsonData objectForKey:@"list"];
    
    _data = [NSMutableArray arrayWithCapacity:list.count];
    
    for (NSDictionary *dic in list) {
        CommentModel *cm = [[CommentModel alloc] initContentWithDic:dic];
        [self.data addObject:cm];
    }
    //属性tableview
    [_tableView reloadData];
}
#pragma mark - UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    
    cell.comment = self.data[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == _selectedRow) {
        
        CommentModel *cm = self.data[indexPath.row];
        NSString *string = cm.content;
        
        UIFont *font = [UIFont systemFontOfSize:16];
        
        CGSize size = [string sizeWithFont:font constrainedToSize:CGSizeMake(kContentWidth, 1000)];
        /*
        CGSize size =CGSizeMake(kContentWidth,80);
        //    CGSize size = CGSizeMake(300.f, MAXFLOAT);
        //    获取当前文本的
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        //ios7方法，获取文本需要的size，限制宽度
        CGSize  actualsize =[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
        */
        
        return size.height+50;
    }
    
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.记录选中的单元格
    _selectedRow = indexPath.row;
    
    //2.刷新tableView，重新获取单元格的高度
    //    [_tableView reloadData];  //刷新所有的单元格
    //刷新指定的组
//        [_tableView reloadSections:<#(NSIndexSet *)#> withRowAnimation:<#(UITableViewRowAnimation)#>];
    
    //刷新指定的单元格
    [_tableView reloadRowsAtIndexPaths:@[indexPath]
                      withRowAnimation:UITableViewRowAnimationFade];
}


@end
