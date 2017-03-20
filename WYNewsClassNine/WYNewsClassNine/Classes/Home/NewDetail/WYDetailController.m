//
//  WYDetailController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYDetailController.h"
#import "WYNetworkTool+news.h"


@interface WYDetailController ()

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation WYDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建 webView
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.backgroundColor = [UIColor whiteColor];
    
    //调整 webView 的滑动速度
    _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    [self.view addSubview:_webView];
    
    //加载数据并显示
    [self loadData];
}



/**
 获取并加载数据
 */
- (void)loadData
{
    //获取详情页并展示
    [[WYNetworkTool sharedTool] requestNewsListWithDetail:_newsModel.docid withCallBack:^(NSString *bodyStr) {
        NSLog(@"@@@@@@@ :  %@",bodyStr);
        //加载 html 字符串
        [_webView loadHTMLString:bodyStr baseURL:nil];
        
        
    }];
    
    
    
}





@end
