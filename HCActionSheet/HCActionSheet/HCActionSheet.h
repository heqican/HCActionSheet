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

 @param titleText 显示标题（传入为nil或者@""时，不显示标题栏）
 @param itemsBlock 添加选择项
 @param selectedBlock 点击选择项回调
 */
+(void)showActionSheetWithTitle:(NSString *)titleText itemBlock:(HCItemsBlock)itemsBlock selectedBlock:(HCSelectedBlock)selectedBlock;


@end
