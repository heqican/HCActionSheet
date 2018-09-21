//
//  HCCONST.h
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/10.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#ifndef HCCONST_h
#define HCCONST_h


static NSString *const kSelectionCellNameKey = @"SelectionCellNameKey";
static NSString *const SelectionSubTitleCellNameKey = @"SelectionSubTitleCellNameKey";
static NSString *const kSelectionCellImageNameKey = @"SelectionCellImageNameKey";
static NSString *const kSelectionCellTagKey = @"SelectionCellTagKey";
static NSString *const kSelectionViewShouldDismissKey = @"SelectionViewShouldDismissKey";

#define kColorWithHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]

#define kSelectionCellHeight 58
#define KSelectionViewMaxHeight 320

#define kSelectionHeadHeight 30

#define kTitleTextColor [UIColor blackColor] //标题颜色
#define kCancelTextColor [UIColor colorWithRed:104/255.0 green:165/255.0 blue:225/255.0 alpha:1.0]


#endif /* HCCONST_h */
