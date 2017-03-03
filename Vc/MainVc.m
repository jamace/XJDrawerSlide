//
//  MainVc.m
//  HuaAnXin
//
//  Created by cnmobi on 16/9/19.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "MainVc.h"
#import "UIViewController+MMDrawerController.h"
#import "NextVc.h"
#import "XJHelper.h"
@interface MainVc ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self addNavView];
    
    _titleArray = @[@"1",@"2",@"3",@"4",@"5"];
    UITableView *tablView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tablView.delegate = self;
    tablView.dataSource = self;
    [self.view addSubview:tablView];
}
#pragma mark --- 监听通知
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftSilder:) name:XNOTIFICATION_LEFTS object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rightSilder:) name:XNOTIFICATION_LEFTS object:nil];
}
#pragma mark --- 移除通知
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XNOTIFICATION_LEFTS object:nil];
}

#pragma mark --- 监听方法
- (void)leftSilder:(NSNotification *)not
{
    NSString *index = [not.userInfo objectForKey:@"selIndex"];
    NSLog(@"index---------%@",index);
    
    //延迟push
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NextVc *Vc = [[NextVc alloc] init];
//        [self.navigationController pushViewController:Vc animated:YES];
//    });
    
    NextVc *Vc = [[NextVc alloc] init];
    [self.navigationController pushViewController:Vc animated:YES];
    
    //销毁通知。否则通知会叠加多次发送
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:XNOTIFICATION_LEFTS object:nil];
    
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
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NextVc *Vc = [[NextVc alloc] init];
    [self.navigationController pushViewController:Vc animated:YES];
}

#pragma mark --- 导航栏
-(void)addNavView
{
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

}
#pragma mark --- 开启左菜单
-(void)left
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
 
}
#pragma mark --- 开启右菜单
-(void)right
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
@end
