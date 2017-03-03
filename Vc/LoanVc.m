//
//  LoanVc.m
//  HuaAnXin
//
//  Created by cnmobi on 16/9/19.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "LoanVc.h"
#import "UIViewController+MMDrawerController.h"
@interface LoanVc ()
@end

@implementation LoanVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化
    [self addNavView];
    
}

#pragma mark --- 导航栏
-(void)addNavView
{
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStyleDone target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
-(void)left
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)right
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

@end
