//
//  WYMainViewController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYMainViewController.h"


@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //字典数组
    NSArray *dicArr = @[@{@"clsName":@"WYHomeController",@"title":@"首页",@"icon":@"news"},
                        @{@"clsName":@"UIViewController",@"title":@"阅读",@"icon":@"reader"},
                        @{@"clsName":@"UIViewController",@"title":@"视频",@"icon":@"media"},
                        @{@"clsName":@"UIViewController",@"title":@"话题",@"icon":@"found"},
                        @{@"clsName":@"UIViewController",@"title":@"我",@"icon":@"me"
                        }];
    
    NSMutableArray<UINavigationController *> *arrM = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArr) {
        
        //把字典数组转换成模型数组
        UINavigationController *nav = [self children:dic];
        
        [arrM addObject:nav];
    }

    self.viewControllers = arrM;
    
}

//创建单个子控制器
- (UINavigationController *)children:(NSDictionary *)dic
{
    //取到字典中的key转换成类
    NSString *clsName = dic[@"clsName"];
    
    Class cls = NSClassFromString(clsName);
    //创建类
    UIViewController *vc = [[cls alloc] init];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    //设置控制器属性
    vc.title = dic[@"title"];
    //设置选中时的颜色
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    
    //设置图片
    //设置原始状态图片和颜色
    UIImage *img = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_%@_normal",dic[@"icon"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image = img;

    //设置选中状态图片
    UIImage *selectImg = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_%@_highlight",dic[@"icon"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = selectImg;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}






@end
