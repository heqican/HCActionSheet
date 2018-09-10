//
//  ViewController.m
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/8.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "ViewController.h"
#import "HCActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50);
    [btn setTitle:@"显示ActionSheet" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


/**
 显示ActionSheet

 @param sender <#sender description#>
 */
-(void)showAction:(id)sender{
    [HCActionSheet showActionSheetWithTitle:@"选择支付方式" itemBlock:^(id<HCActionSheetProtocol> items) {
        [items addItemWithLabelText:@"标题一" imageName:@"image_conf" shouldDismiss:YES];
        [items addItemWithLabelText:@"标题二" imageName:@"image_finish" shouldDismiss:YES];
    } selectedBlock:^(NSInteger selectItem) {
        NSLog(@"点击了：%ld",selectItem);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
