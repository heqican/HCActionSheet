//
//  HCActionSheet.h
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/8.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCActionSheetItems.h"


typedef void(^HCItemsBlock)(id <HCActionSheetProtocol>items);
typedef void(^HCSelectedBlock)(NSInteger selectItem);

@interface HCActionSheet : UIView

/**
 显示ActionSheet
 
 @param itemsBlock 添加子项回调
 @param selectedBlock 选中项回调
 */
+(void)showActionSheetWithItemBlock:(HCItemsBlock)itemsBlock selectedBlock:(HCSelectedBlock)selectedBlock;

@end
