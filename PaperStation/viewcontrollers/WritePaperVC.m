//
//  WritePaperVC.m
//  network_AFN
//
//  Created by tybbt on 2018/6/3.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "WritePaperVC.h"

@interface WritePaperVC ()
@property (nonatomic, strong) UILabel * label;
@end

@implementation WritePaperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        _label.text = @"write paper";
    }
    return _label;
}


@end
