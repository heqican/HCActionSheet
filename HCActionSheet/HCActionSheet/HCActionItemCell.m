//
//  HCActionItemCell.m
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/10.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "HCActionItemCell.h"
#import "HCCONST.h"

@implementation HCActionItemCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //图片
        UIImageView *pictureView=[[UIImageView alloc]init];
        self.pictureView=pictureView;
        pictureView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:pictureView];
        
        //文字
        UILabel *labelView=[[UILabel alloc]init];
        labelView.backgroundColor = [UIColor clearColor];
        labelView.font=[UIFont systemFontOfSize:16];
        [labelView setTextColor:[UIColor colorWithRed:39/255.0 green:44/255.0 blue:47/255.0 alpha:1.0]];
        self.labelView=labelView;
        [self.contentView addSubview:labelView];
        
        //下划线
        UIView *lineView=[[UIView alloc]init];
        self.lineView=lineView;
        lineView.backgroundColor = kColorWithHex(0xd2d5d9);
        [self.contentView addSubview:lineView];
        
        UIView *selectedBackgroundView = [[UIView alloc] init];
        selectedBackgroundView.backgroundColor = kColorWithHex(0xf5f6f7);
        self.selectedBackgroundView = selectedBackgroundView;
        
        self.contentView.backgroundColor = kColorWithHex(0xffffff);
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat picW=24;
    CGFloat picH=24;
    CGFloat picX=8;
    CGFloat picY=self.bounds.size.height*0.5-picH*0.5;
    self.pictureView.frame=CGRectMake(picX, picY, picW, picH);
    
    CGFloat labelX=CGRectGetMaxX(self.pictureView.frame)+8;
    CGFloat labelY=0;
    CGFloat labelW=self.bounds.size.width-labelX;
    CGFloat labelH=self.bounds.size.height;
    self.labelView.frame=CGRectMake(labelX, labelY, labelW, labelH);
    
    
    CGFloat lineX=0;
    CGFloat lineW=self.bounds.size.width-lineX;
    CGFloat lineH=0.5;
    CGFloat lineY=self.bounds.size.height-lineH;
    self.lineView.frame=CGRectMake(lineX, lineY, lineW, lineH);
    
}

-(void)setInfoDictionary:(NSDictionary *)infoDictionary{
    _infoDictionary = infoDictionary;
    NSString *imageName = infoDictionary[kSelectionCellImageNameKey];
    if (imageName && [imageName isKindOfClass:[NSString class]] && imageName.length) {
        self.pictureView.image=[UIImage imageNamed:imageName];
    }
    
    NSString *nameStr = infoDictionary[kSelectionCellNameKey];
    self.labelView.text = [nameStr description];
    
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
