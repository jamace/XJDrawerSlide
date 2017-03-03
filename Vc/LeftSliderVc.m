//
//  LeftSliderVc.m
//  XJDrawerSlide
//
//  Created by 肖吉 on 2017/3/1.
//  Copyright © 2017年 jamace. All rights reserved.
//

#import "LeftSliderVc.h"
#import "UIViewController+MMDrawerController.h" //导入这个可打开关闭视图
#import "NextVc.h"
#import "XJHelper.h"
@interface LeftSliderVc ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation LeftSliderVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        [tempArray addObject:[NSString stringWithFormat:@"%i-------------",i]];
    }
    _titleArray = [tempArray mutableCopy];
    
    UITableView *tablView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tablView.backgroundColor = [UIColor clearColor];
    tablView.delegate = self;
    tablView.dataSource = self;
    [self.view addSubview:tablView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
    //发送通知
    NSNotification *not = [NSNotification notificationWithName:XNOTIFICATION_LEFTS object:nil userInfo:@{@"selIndex":[NSString stringWithFormat:@"%ld",indexPath.row]}];
    [[NSNotificationCenter defaultCenter] postNotification:not];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
