· - 松小宝 -
# HCActionSheet
自定义UIActionSheet

//使用方法
#import "HCActionSheet.h"


-(void)showAction:(id)sender{

    [HCActionSheet showActionSheetWithTitle:@"选择支付方式" itemBlock:^(id<HCActionSheetProtocol> items) {
        
        [items addItemWithTitle:@"微信支付" subTitle:@"微信支付更省钱" imageName:@"image_wechat" shouldDismiss:YES];
        
        [items addItemWithTitle:@"支付宝支付" subTitle:@"支付宝支付才省钱" imageName:@"image_alipay" shouldDismiss:YES];
        
    } selectedBlock:^(NSInteger selectItem) {
    
        NSLog(@"点击了：%ld",selectItem);
        
    }];
    
}

    
    
