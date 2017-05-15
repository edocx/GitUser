//
//  NewsDetailViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
{
    UIWebView *_webView;
    UIActivityIndicatorView *_activityView;
}
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    //web页面会根据屏幕大小进行自动缩放
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_activityView stopAnimating];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_activityView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    //1.加载网络URL
    /*
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    */
    //2.加载本地的HTML代码
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"baidu" ofType:@"html"];
    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",s);

    [_webView loadHTMLString:s baseURL:nil];
    [self.view addSubview:_webView];
     */
    
    
    //加载数据
    [self loadData];
    
}
- (void)loadData {
    
    NSDictionary *jsonData = [WXDataService requestData:news_detail];
    NSString *content = [jsonData objectForKey:@"content"];
    NSString *source = [jsonData objectForKey:@"source"];
    NSString *time = [jsonData objectForKey:@"time"];
    NSString *author = [jsonData objectForKey:@"author"];
    NSString *title = [jsonData objectForKey:@"title"];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //子标题：来源：时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    //编辑(作者)
    NSString *at = [NSString stringWithFormat:@"（编辑：%@）",author];
    
    //拼接完整的html
    NSString *htmlstring = [NSString stringWithFormat:html,title,subTitle,content,at];
    
    //加载html
    [_webView loadHTMLString:htmlstring baseURL:nil];
}
#pragma mark - UIWebView delegate
//1.webView开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_activityView startAnimating];
}

//2.webView加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityView stopAnimating];
}

@end
