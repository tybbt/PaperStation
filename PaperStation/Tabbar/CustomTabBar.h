//
//  CustomTabBar.h
//  network_AFN
//
//  Created by tybbt on 2018/6/2.
//  Copyright © 2018年 123 . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTabbarDelegate <NSObject>
- (void)startWritePaper;
@end

@interface CustomTabBar : UITabBar

@end
