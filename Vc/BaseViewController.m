//
//  BaseViewController.m
//  DevFrameworkDemo
//
//  Created by cnmobi on 16/6/16.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+MMDrawerController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    此处设置是取消自适应导航栏的高度
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //    改变返回按钮颜色
//    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *ownerClass = NSStringFromClass([self class]);
    
    if ([ownerClass isEqualToString:@"MainVc"]||[ownerClass isEqualToString:@"LoanVc"]||[ownerClass isEqualToString:@"MoreVc"]||[ownerClass isEqualToString:@"LeftSliderVc"]||[ownerClass isEqualToString:@"RightSilderVc"]) {
        
        self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    }else{
        //不是首页的话要关闭侧滑手势
        self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
        self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeNone;
    }
    
}

@end
