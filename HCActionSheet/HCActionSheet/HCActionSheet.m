//
//  HCActionSheet.m
//  HCActionSheet
//
//  Created by 何其灿 on 2018/9/8.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "HCActionSheet.h"
#import "HCActionItemCell.h"
#import "HCActionCancelCell.h"
#import "HCCONST.h"



@interface HCActionSheet () <UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) HCActionSheetItems *items;
@property (copy,nonatomic) void (^selectedBlock)(NSInteger selectedItem);
@end

@implementation HCActionSheet

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.frame = keyWindow.bounds;
        
        //手势
        UIView *gesView = [[UIView alloc] initWithFrame:self.bounds];
        gesView.backgroundColor = [UIColor clearColor];
        [gesView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenSelf)]];
        [self addSubview:gesView];
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubview:self.tableView];
    }
    return self;
}

+(void)showActionSheetWithItemBlock:(HCItemsBlock)itemsBlock selectedBlock:(HCSelectedBlock)selectedBlock{
    HCActionSheet *actionSheet = [[HCActionSheet alloc] initWithFrame:CGRectZero];
    [actionSheet showActionSheetWithItemBlock:itemsBlock selectedBlock:selectedBlock];
}

-(void)showActionSheetWithItemBlock:(HCItemsBlock)itemsBlock selectedBlock:(HCSelectedBlock)selectedBlock{
    self.selectedBlock = selectedBlock;
    itemsBlock(self.items);
    
    CGFloat tableHeight = (self.items.count + 1) * kSelectionCellHeight;
    if (tableHeight <= KSelectionViewMaxHeight) {
        self.tableView.scrollEnabled = NO;
    }else{
        self.tableView.scrollEnabled = YES;
    }
    
    tableHeight = tableHeight > KSelectionViewMaxHeight ? KSelectionViewMaxHeight : tableHeight ;
    self.tableView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, tableHeight);
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect tableViewFrame = self.tableView.frame;
        tableViewFrame.origin.y = [UIScreen mainScreen].bounds.size.height - tableHeight;
        self.tableView.frame = tableViewFrame;
    }];
}


/**
 隐藏视图
 */
-(void)hiddenSelf{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        CGRect tableViewFrame = self.tableView.frame;
        tableViewFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.tableView.frame = tableViewFrame;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

#pragma mark - tableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{//选项
            return self.items.count;
            break;
        }
        case 1:{//取消
            return 1;
            break;
        }
        default:
            break;
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  kSelectionCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *HCActionCellStr = @"HCActionCellStr";
    static NSString *HCActionCancelCellStr = @"HCActionCancelCellStr";
    UITableViewCell *hcCell;
    switch (indexPath.section) {
        case 0:{//选项行
            HCActionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:HCActionCellStr];
            if (cell == nil) {
                cell = [[HCActionItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HCActionCellStr];
            }
            if (self.items.count > indexPath.row) {
                cell.infoDictionary = self.items.itemsArray[indexPath.row];
            }
            hcCell = cell;
            break;
        }
        case 1:{//取消行
            HCActionCancelCell *cell = [tableView dequeueReusableCellWithIdentifier:HCActionCancelCellStr];
            if (cell == nil) {
                cell = [[HCActionCancelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HCActionCancelCellStr];
            }
            hcCell = cell;
            break;
        }
            
        default:
            break;
    }
    
    if (!hcCell) {
        hcCell = [[UITableViewCell alloc] init];
    }
    
    return hcCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.section == 0) {
            self.selectedBlock(indexPath.row);
            //是否隐藏
            BOOL shouldDismiss = [[self.items.itemsArray[indexPath.row] objectForKey:kSelectionViewShouldDismissKey] boolValue];
            if (shouldDismiss) {
                [self hiddenSelf];
            }
        }else{
            [self hiddenSelf];
        }
    }else{
        [self hiddenSelf];
    }
}



#pragma mark - lazy load
-(HCActionSheetItems *)items{
    if (!_items) {
        _items = [[HCActionSheetItems alloc] init];
    }
    return _items;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
