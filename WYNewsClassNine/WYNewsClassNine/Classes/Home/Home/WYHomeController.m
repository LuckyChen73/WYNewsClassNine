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

@interface WYHomeController ()<UIPageViewControllerDataSource,WYChannelViewDelegate,UIPageViewControllerDelegate>

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
    view.channelDelegate = self;
    
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
    _pageVC.delegate = self;
    
}

#pragma mark - UIPageViewController的代理方法

/**
 pageViewController的子控制器将要滑动的时候调用

 @param pageViewController 当前控制器
 @param pendingViewControllers 将要跳转到的子控制器数组
 */
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    //1.获取将要跳转的子控制器
    WYNewsListController *newsVC = (WYNewsListController*)pendingViewControllers[0];
    
    //把将要跳转的子控制器的下标赋给标签视图的选中下标
    _channelView.isSelectedIndex = newsVC.index;
    
}


/**
 已经完成动画的时候来调用

 @param pageViewController 当前控制器
 @param finished 是否完成动画
 @param previousViewControllers 保存之前控制器的数组
 @param completed 滑动完成
 */
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    //1.获取当前的子控制器
    WYNewsListController *newsVC = (WYNewsListController *)_pageVC.viewControllers[0];
    //把将要当前的子控制器的下标赋给标签视图的选中下标
    _channelView.isSelectedIndex = newsVC.index;
    
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
    //取到当前控制器的下标减1，的到前一个控制器的下标
    NSInteger index = viewController.index - 1;
    //创建前一个控制器并初始化，把下标赋值
    WYNewsListController *newsVC = [[WYNewsListController alloc] initWithIndex:index withChannelModel:_channelView.modelArr[index]];
    
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
    
    NSInteger index = viewController.index + 1;
    
    WYNewsListController *newsVC = [[WYNewsListController alloc] initWithIndex:index withChannelModel:_channelView.modelArr[index]];
    
    return newsVC;
    
}


@end
