· - 松小宝 -
# HCActionSheet
自定义UIActionSheet

//使用方法
#import "HCActionSheet.h"

[HCActionSheet showActionSheetWithTitle:@"选择支付方式" itemBlock:^(id<HCActionSheetProtocol> items) {
        [items addItemWithLabelText:@"微信支付" imageName:@"image_wechat" shouldDismiss:YES];
        [items addItemWithLabelText:@"支付宝支付" imageName:@"image_alipay" shouldDismiss:YES];
    } selectedBlock:^(NSInteger selectItem) {
        NSLog(@"点击了：%ld",selectItem);
    }];
    
    
