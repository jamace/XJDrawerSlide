//
//  AppDelegate.m
//  XJDrawerSlide
//
//  Created by 肖吉 on 2017/3/1.
//  Copyright © 2017年 jamace. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "BaseTabBarController.h"
#import "BaseNavController.h"
#import "LeftSliderVc.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "RightSilderVc.h"
#import "XJHelper.h"
@interface AppDelegate ()
@property (nonatomic, strong) MMDrawerController *mmDrawController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //初始化中央视图tabbar
    BaseTabBarController * myTabBar = [[BaseTabBarController alloc]init];
    // 初始化左边栏抽屉视图VC
    LeftSliderVc *leftVc = [[LeftSliderVc alloc] init];
    // 初始化右边边栏抽屉视图VC（不需要则注释掉下面一行代码即可）
    RightSilderVc *RightVc = [[RightSilderVc alloc] init];
    
    //设置抽屉视图VC
    self.mmDrawController = [[MMDrawerController alloc] initWithCenterViewController:myTabBar leftDrawerViewController:leftVc rightDrawerViewController:RightVc];
    // 设置左/右视图VC宽度
    [self.mmDrawController setMaximumLeftDrawerWidth:SCREEN_WIDTH*0.8];
    [self.mmDrawController setMaximumRightDrawerWidth:SCREEN_WIDTH*0.8];
    //设置左视图VC打开方式
    [self.mmDrawController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    //设置左视图VC关闭方式
    [self.mmDrawController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    //设置抽屉视图VC阴影效果
    self.mmDrawController.showsShadow = NO;
    //设置右滑动打开左边栏
    [MMExampleDrawerVisualStateManager sharedManager].leftDrawerAnimationType = MMDrawerAnimationTypeSlide;
    //设置抽屉VC的可视化状态？
    [self.mmDrawController setDrawerVisualStateBlock:
     ^(MMDrawerController *drawerController,
       MMDrawerSide drawerSide,
       CGFloat percentVisible)
     {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    //将抽屉视图VC设置为根VC。
    self.window.rootViewController = _mmDrawController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
