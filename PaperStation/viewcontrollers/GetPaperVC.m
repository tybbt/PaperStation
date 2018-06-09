//
//  GetPaperVC.m
//  network_AFN
//
//  Created by tybbt on 2018/6/3.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "GetPaperVC.h"

@interface GetPaperVC ()
@property (nonatomic, strong) UILabel * label;
@end

@implementation GetPaperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor cyanColor];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 100, 100)];
        _label.text = @"get paper";
    }
    return _label;
}

@end
