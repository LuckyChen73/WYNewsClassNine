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

@interface WYNewsListController ()<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *modelArrM;

@property (nonatomic, weak) UITableView *tabV;

@end
//重用标识
static NSString *normalCellID = @"normalCellID";
static NSString *bigImageCellID = @"normalCellID";
static NSString *newsHeadCellID = @"normalCellID";

@implementation WYNewsListController

- (instancetype)initWithIndex:(NSInteger)index withChannelModel:(WYChannelModel *)model
{
    if (self = [super init]) {
        
        self.index = index;
        _model = model;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTableView];
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
    
    //注册 cell
    [tabV registerClass:[WYNewsNormalCell class] forCellReuseIdentifier:normalCellID];
    
    UINib *bigNib = [UINib nibWithNibName:@"WYBigImageCell" bundle:nil];
    [tabV registerNib:bigNib forCellReuseIdentifier:bigImageCellID];
    
    UINib *newsNib = [UINib nibWithNibName:@"WYNewsHeadCell" bundle:nil];
    [tabV registerNib:newsNib forCellReuseIdentifier:newsHeadCellID];
    
    
    //设置 tabView 的行高
    tabV.estimatedRowHeight = 200;
    tabV.rowHeight = UITableViewAutomaticDimension;
 
    //记录
    _tabV = tabV;
    
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArrM.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if (indexPath.row == 0) {
//        
//        WYNewsNormalCell *newsHeadCell = [tableView dequeueReusableCellWithIdentifier:newsHeadCellID forIndexPath:indexPath];
//        
//        return newsHeadCell;
//    }else {
    
    
        WYNewsNormalCell * normalCell = [tableView dequeueReusableCellWithIdentifier:normalCellID forIndexPath:indexPath];
    
    
        return normalCell;
//    }
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
