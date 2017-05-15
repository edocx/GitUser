//
//  MoreTableViewController.m
//  WXMovie
//
//  Created by imac on 15/9/17.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MoreTableViewController.h"
#import "SDImageCache.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}
//计算缓存的方法
- (double)_countCacheSize{
    //获取到缓存的路径
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/ImageCache"];
    
    NSLog(@"%@",NSHomeDirectory());
    NSFileManager *fileManeger = [NSFileManager defaultManager];
    //1.取得一个文件夹中所有文件的路径
    NSArray *subPaths = [fileManeger subpathsAtPath:imagePath];
    NSLog(@"%@",subPaths);
    
    long sum = 0;
    
    for (NSString *subPath in subPaths) {
        //拼接得到每个文件的全路径
        NSString *filePath = [imagePath stringByAppendingPathComponent:subPath];
        //2.获取文件的大小、文件的内容等属性
        NSDictionary *dic = [fileManeger attributesOfItemAtPath:filePath error:nil];
        
        NSLog(@"%@",dic);
        //获取每一个文件的大小
        NSNumber *subSizeNum = [dic objectForKey:@"NSFileSize"];
        long subSize = [subSizeNum longValue];
        
        sum += subSize;
    }
    //转换单位字节为兆
    double size = sum / 1000 /1000.0;
    return size;
    
}
//当cell显示的时候，调用该方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    double size = [self _countCacheSize];
    label.text = [NSString stringWithFormat:@"%.1fM",size];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"清楚缓冲" message:@"确定清除缓存？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alertV show];
        
    }
    
}
#pragma mark - UIAlertView Delegate
//UIAlertView的按钮被点击时调用
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        [[SDImageCache sharedImageCache] clearDisk];
        
        [self.tableView reloadData];
    }
    
}



@end
