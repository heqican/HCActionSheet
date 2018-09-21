//
//  HCActionItemCell.h
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/10.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCActionItemCell : UITableViewCell

@property (nonatomic, strong)UIImageView *pictureView;
@property (nonatomic, strong)UILabel *labelView;
@property (nonatomic, strong)UILabel *subTitle;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)NSDictionary *infoDictionary;

@property (nonatomic, assign) BOOL hasImage;//是否有图片
@property (nonatomic, assign) BOOL hadSubTitle;//是否有子标题

@end
