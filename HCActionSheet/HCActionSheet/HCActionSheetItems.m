//
//  HCActionSheetItems.m
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/8.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "HCActionSheetItems.h"
#import "HCCONST.h"

@implementation HCActionSheetItems

-(instancetype)init{
    self = [super init];
    if (self) {
        self.itemsArray = [NSMutableArray array];
    }
    return self;
}

-(void)addItemWithTitle:(NSString *)labelText subTitle:(NSString *)subTitle imageName:(NSString *)imageName shouldDismiss:(BOOL)shouldDismiss{
    if (labelText && [labelText isKindOfClass:[NSString class]] && imageName && [imageName isKindOfClass:[NSString class]]) {
        NSDictionary *itemDic = [NSDictionary dictionaryWithObjectsAndKeys: labelText, kSelectionCellNameKey, subTitle,SelectionSubTitleCellNameKey, imageName, kSelectionCellImageNameKey, [NSNumber numberWithBool:shouldDismiss], kSelectionViewShouldDismissKey, nil];
        [self.itemsArray addObject:itemDic];
    }
}

-(NSInteger)count{
    return self.itemsArray.count;
}

@end
