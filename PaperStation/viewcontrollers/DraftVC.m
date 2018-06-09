//
//  DraftVC.m
//  network_AFN
//
//  Created by tybbt on 2018/6/3.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "DraftVC.h"

@interface DraftVC ()
@property (nonatomic, strong) UILabel * label;
@end

@implementation DraftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 100, 100)];
        _label.text = @"draft paper";
    }
    return _label;
}

@end
