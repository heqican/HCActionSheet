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
 添加选择项
 
 @param labelText 标题文字
 @param imageName 图标
 @param shouldDismiss 选中时候是否隐藏ActionSheet
 */
-(void)addItemWithLabelText:(NSString *)labelText imageName:(NSString *)imageName shouldDismiss:(BOOL)shouldDismiss;

@end

@interface HCActionSheetItems : NSObject <HCActionSheetProtocol>

@property (nonatomic, strong) NSMutableArray *itemsArray;
- (NSInteger) count;

@end
