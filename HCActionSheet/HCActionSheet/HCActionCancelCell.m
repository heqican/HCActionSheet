//
//  HCActionCancelCell.m
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/10.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "HCActionCancelCell.h"
#import "HCCONST.h"

@implementation HCActionCancelCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *labelView = [[UILabel alloc] init];
        labelView.text = @"取消";
        [self.contentView addSubview:labelView];
        self.labelView=labelView;
        labelView.textAlignment=NSTextAlignmentCenter;
        labelView.font=[UIFont systemFontOfSize:16];
        [labelView setTextColor:kCancelTextColor];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat labelX=0;
    CGFloat labelY=0;
    CGFloat labelW=self.bounds.size.width;
    CGFloat labelH=self.bounds.size.height;
    self.labelView.frame=CGRectMake(labelX, labelY, labelW, labelH);
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
