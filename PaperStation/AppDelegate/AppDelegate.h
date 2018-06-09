//
//  AppDelegate.h
//  PaperStation
//
//  Created by tybbt on 2018/6/9.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MenuTabBarController * tabbarController;

@end

