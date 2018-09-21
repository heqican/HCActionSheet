//
//  HCActionSheetItems.h
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/8.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HCActionSheetProtocol <NSObject>

@required

/**
 添加选项

 @param labelText 标题文字
 @param subTitle 副标题文字（可选）
 @param imageName 图标（可选） 图片为空时，文字居中
 @param shouldDismiss 选中后时候隐藏控件
 */
-(void)addItemWithTitle:(NSString *)labelText subTitle:(NSString *)subTitle imageName:(NSString *)imageName shouldDismiss:(BOOL)shouldDismiss;

@end

@interface HCActionSheetItems : NSObject <HCActionSheetProtocol>

@property (nonatomic, strong) NSMutableArray *itemsArray;
- (NSInteger) count;

@end
