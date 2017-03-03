//
//  BaseNavController.m
//  DevFrameworkDemo
//
//  Created by cnmobi on 16/6/16.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "BaseNavController.h"
#import "UIBarButtonItem+XL.h"
#import "UIViewController+MMDrawerController.h"
@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    设置导航栏标题样式
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
//
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
//
    self.navigationBarHidden = NO;
//
    //设置状态栏字体颜色
    [self.navigationBar setBarStyle:UIBarStyleDefault];

    //设置导航条颜色
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        // 自定义返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"icon_fanhui_3" highlightImage:nil targer:self action:@selector(back)];
        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
