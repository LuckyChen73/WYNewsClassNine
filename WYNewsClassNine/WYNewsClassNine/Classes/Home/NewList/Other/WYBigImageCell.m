//
//  WYBigImageCell.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYBigImageCell.h"
#import <UIImageView+WebCache.h>

@interface WYBigImageCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *sourceLab;

@property (weak, nonatomic) IBOutlet UILabel *replyCountLab;



@end




@implementation WYBigImageCell

- (void)setNewsModel:(WYNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    _titleLab.text = newsModel.title;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    _sourceLab.text = newsModel.source;
    _replyCountLab.text = newsModel.replyCount;
}








- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
