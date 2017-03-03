//
//  BaseTabBarController.m
//  DevFrameworkDemo
//
//  Created by cnmobi on 16/6/16.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MainVc.h"
#import "LoanVc.h"
#import "MoreVc.h"
#import "BaseNavController.h"
#import "MMDrawerController.h"

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define KColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0                            alpha:1.0]
#define YBackgroundColor KColor(251, 139, 65)//黄色背景颜色
#define GBackgroundColor KColor(183, 183, 183)//灰色背景颜色
@interface BaseTabBarController ()
@property (nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    初始化子控制器
    [self setSubViewController];
    
}


-(void)setSubViewController
{

    NSArray *image = @[@"icon_shouye_n",@"icon_daikuan",@"icon_gengduo"];
    
    NSArray *selectImage = @[@"icon_shouye",@"icon_daikuan_s",@"icon_gengduo_s"];
    
    MainVc *main = [[MainVc alloc] init];
    
    [self addChildViewController:main title:@"首页" image:[UIImage imageNamed:image[0]] selectImage:[UIImage imageNamed:selectImage[0]]];
    
    LoanVc *loan = [[LoanVc alloc] init];
    
    [self addChildViewController:loan title:@"贷款" image:[UIImage imageNamed:image[1]] selectImage:[UIImage imageNamed:selectImage[1]]];
    
    MoreVc *more = [[MoreVc alloc] init];
    
    [self addChildViewController:more title:@"更多" image:[UIImage imageNamed:image[2]] selectImage:[UIImage imageNamed:selectImage[2]]];
    

 
}
/**
 *  添加子控制器
 *
 *  @param childController 需要添加的子控制器
 *  @param title           每个子控制器的标题
 *  @param image           未被选中的图片
 *  @param selectImage     被选中时候的图片
 */

-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage
{

    childController.tabBarItem.title = title;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:GBackgroundColor} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YBackgroundColor} forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    if (iOS7) {
        childController.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childController.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childController.tabBarItem.selectedImage = selectImage;
    }
    
    
    childController.title = title;
    
    BaseNavController *navController = [[BaseNavController alloc] initWithRootViewController:childController];
    [self addChildViewController:navController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
