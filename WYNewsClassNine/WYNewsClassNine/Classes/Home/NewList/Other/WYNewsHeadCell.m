//
//  WYBigImageCell.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsHeadCell.h"
#import <UIImageView+WebCache.h>

@interface WYNewsHeadCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bigImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;



@end


@implementation WYNewsHeadCell

- (void)setNewsModel:(WYNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    [_bigImgView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    _titleLab.text = newsModel.title;
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
