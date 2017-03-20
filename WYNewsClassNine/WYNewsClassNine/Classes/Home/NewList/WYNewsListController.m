//
//  WYNewsListController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsListController.h"
#import <Masonry.h>
#import "WYNewsNormalCell.h"
#import "WYNetworkTool+news.h"
#import "WYNewsHeadCell.h"
#import "WYBigImageCell.h"
#import "WYThreeImageCell.h"
#import "WYDetailController.h"

@interface WYNewsListController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *modelArrM;

@property (nonatomic, weak) UITableView *tabV;

@end
//重用标识
static NSString *normalCellID = @"normalCellID";
static NSString *bigImageCellID = @"bigImageCellID";
static NSString *newsHeadCellID = @"newsHeadCellID";
static NSString *imgExtraCellID = @"imgExtraCellID";

@implementation WYNewsListController

- (instancetype)initWithIndex:(NSInteger)index withChannelModel:(WYChannelModel *)model
{
    if (self = [super init]) {
        
        self.index = index;
        _model = model;
        
        _modelArrM = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTableView];
    
    [self loadData];
    
}

#pragma mark - 添加 tableView
- (void)addTableView
{
    //创建tabView
    UITableView *tabV = [[UITableView alloc] init];
    tabV.backgroundColor = [UIColor whiteColor];
    tabV.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    
    [self.view addSubview:tabV];
    [tabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    //设置数据源
    tabV.dataSource = self;
    
    //设置代理
    tabV.delegate = self;
    
    
    //注册 cell
    [tabV registerClass:[WYNewsNormalCell class] forCellReuseIdentifier:normalCellID];
    
    UINib *bigNib = [UINib nibWithNibName:@"WYBigImageCell" bundle:nil];
    [tabV registerNib:bigNib forCellReuseIdentifier:bigImageCellID];
    
    UINib *headNib = [UINib nibWithNibName:@"WYNewsHeadCell" bundle:nil];
    [tabV registerNib:headNib forCellReuseIdentifier:newsHeadCellID];
    
    UINib *extraNib = [UINib nibWithNibName:@"WYThreeImageCell" bundle:nil];
    [tabV registerNib:extraNib forCellReuseIdentifier:imgExtraCellID];
    
    //设置 tabView 的行高
    tabV.estimatedRowHeight = 200;
    tabV.rowHeight = UITableViewAutomaticDimension;
 
    //记录
    _tabV = tabV;
    
    
}

#pragma mark - tabView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //动画取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //跳转到详情控制器
    WYDetailController *detailVC = [[WYDetailController alloc]init];
    
    //根据下标取到对应的模型数据
    WYNewsModel *model = _modelArrM[indexPath.row];
    detailVC.newsModel = model;
    
    //隐藏标签栏
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
    
    
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArrM.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到模型
    WYNewsModel *model = _modelArrM[indexPath.row];
    //是否是头部 cell
    if (model.hasHead) {
        
         WYNewsHeadCell *newsHeadCell = [tableView dequeueReusableCellWithIdentifier:newsHeadCellID forIndexPath:indexPath];
        newsHeadCell.newsModel = model;
        
        return newsHeadCell;
     //是否是大图
    }else if(model.imgType) {
    
        WYBigImageCell *bigImgCell = [tableView dequeueReusableCellWithIdentifier:bigImageCellID forIndexPath:indexPath];
        bigImgCell.newsModel = model;
        
        return bigImgCell;
    //是否是三张图
    }else if(model.imgExtra != nil) {
        
        WYThreeImageCell *imgExtraCell = [tableView dequeueReusableCellWithIdentifier:imgExtraCellID forIndexPath:indexPath];
        imgExtraCell.newsModel = model;
        
        return imgExtraCell;
        
    }
    
    //普通 cell
    WYNewsNormalCell * normalCell = [tableView dequeueReusableCellWithIdentifier:normalCellID forIndexPath:indexPath];
    
    normalCell.newsModel = _modelArrM[indexPath.row];
    
    return normalCell;
}


#pragma mark - 加载数据
- (void)loadData
{
    [[WYNetworkTool sharedTool]requestNewsListWithTid:_model.tid withCallBack:^(NSArray *modelArr) {
        
        [_modelArrM addObjectsFromArray:modelArr];
        //刷新界面
        [_tabV reloadData];
    }];
}


@end
