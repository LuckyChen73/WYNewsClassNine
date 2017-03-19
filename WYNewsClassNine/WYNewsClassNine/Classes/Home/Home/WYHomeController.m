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

@interface WYHomeController ()<UIPageViewControllerDataSource,WYChannelViewDelegate>

@property (nonatomic, weak) WYChannelView *channelView;

@property (nonatomic, weak) WYNewsListController *newsVC;

@property (nonatomic, strong) UIPageViewController *pageVC;

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
    
    //设置代理
    view.delegate = self;
    
    _channelView = view;
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.right.offset(0);
        make.height.offset(40);
    }];

}

#pragma mark - 实现 channelview 的代理方法
- (void)channelView:(NSInteger)index
{
    //点击标签获得
    NSLog(@"%zd",index);
    
    
    //1.获取当前子控制器的下标
    WYNewsListController *newVC = (WYNewsListController *)_pageVC.viewControllers[0];
    //把当前子控制器的下标作为当前下标
    NSInteger currentIdx = newVC.index;
    
    if (currentIdx == index) return;//如果当前控制器等于点击的标签的下标，就什么也不做
    
    //如果大于，则从右往左推，反之
    NSInteger direction = currentIdx > index ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward;
    
    //创建将要显示的子控制器
    WYNewsListController *willShowNewsVC = [[WYNewsListController alloc]initWithIndex:index withChannelModel:_channelView.modelArr[index]];
    
    [_pageVC setViewControllers:@[willShowNewsVC] direction:direction animated:YES completion:nil];
    
}




#pragma mark - 添加左右滑的新闻页
- (void)setPageViewController
{
    //1.创建 pageViewController
    
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:@0}];
    
    //2.将 pageVC添加到 rootVC
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    [_pageVC didMoveToParentViewController:self];
    
    //调整 pageVC 布局
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_channelView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
    
    
    //3.添加子控制器
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    NSArray *controllers = @[newsVC];
    
    [_pageVC setViewControllers:controllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    //4.实现数据源
    _pageVC.dataSource = self;
    
    
}


#pragma mark - 数据源方法

/**
 生成前一个控制器

 @param pageViewController 当前控制器
 @param viewController 当前子控制器
 @return 放回前一个控制器
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(WYNewsListController *)viewController
{
    //滚到头了
    if (viewController.index == 0) {
        return nil;
    }
    
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    
    return newsVC;
}


/**
 生成后一个控制器

 @param pageViewController <#pageViewController description#>
 @param viewController <#viewController description#>
 @return <#return value description#>
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(WYNewsListController *)viewController
{
    //滚到尾了
    if (viewController.index == _channelView.modelArr.count - 1) {
        
        return nil;
    }
    
    WYNewsListController *newsVC = [[WYNewsListController alloc] init];
    return newsVC;
    
}


@end
