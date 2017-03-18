//
//  WYHomeController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYHomeController.h"
#import <Masonry.h>
#import "WYChannelView.h"
#import "WYNewsListController.h"

@interface WYHomeController ()<UIPageViewControllerDataSource>

@property (nonatomic, weak) WYChannelView *channelView;

@end

@implementation WYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addChannelView];
    
    [self setPageViewController];
    
    
}


//添加频道视图
- (void)addChannelView
{
    WYChannelView *view = [[WYChannelView alloc]init];
    
    _channelView = view;
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.right.offset(0);
        make.height.offset(40);
    }];

}

#pragma mark - 添加左右滑的新闻页
- (void)setPageViewController
{
    //1.创建 pageViewController
    UIPageViewController *pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:@0}];
    
    //2.将 pageVC添加到 rootVC
    [self addChildViewController:pageVC];
    [self.view addSubview:pageVC.view];
    [pageVC didMoveToParentViewController:self];
    
    //调整 pageVC 布局
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_channelView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
    
    
    //3.添加子控制器
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    NSArray *controllers = @[newsVC];
    
    [pageVC setViewControllers:controllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    //4.实现数据源
    pageVC.dataSource = self;
}


#pragma mark - 数据源方法

/**
 生成前一个控制器

 @param pageViewController 当前控制器
 @param viewController 当前子控制器
 @return 放回前一个控制器
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    
    return newsVC;
}


/**
 生成后一个控制器

 @param pageViewController <#pageViewController description#>
 @param viewController <#viewController description#>
 @return <#return value description#>
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    return newsVC;
    
}


@end
