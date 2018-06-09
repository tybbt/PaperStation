//
//  MenuTabBarController.m
//  network_AFN
//
//  Created by tybbt on 2018/6/2.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "MenuTabBarController.h"
#import "CustomTabBar.h"
#import "PaperViewController.h"
#import "MineViewController.h"

@interface MenuTabBarController ()<CustomTabbarDelegate>

@end

@implementation MenuTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[CustomTabBar alloc] init] forKey:@"tabBar"];
    [self initializeTabBar];
}

- (void)initializeTabBar
{
    NSArray * titleList = @[@"首页",@"我的"];
    
    PaperViewController *homeVC = [PaperViewController new];
    [self addChildViewController:homeVC withTitle:titleList[0] withImage:[UIImage imageNamed:@"tabBar_home"]];
    
    MineViewController *mineVC = [MineViewController new];
    [self addChildViewController:mineVC withTitle:titleList[1] withImage:[UIImage imageNamed:@"tabBar_mine"]];
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title withImage:(UIImage *)image
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.navigationItem.title = title;
    navController.tabBarItem.title = title;
    navController.tabBarItem.image = image;
    [self addChildViewController:navController];
}

- (void)startWritePaper
{
    
}

@end
