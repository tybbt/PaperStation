//
//  PostPaperVC.m
//  network_AFN
//
//  Created by tybbt on 2018/6/3.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "PostPaperVC.h"

@interface PostPaperVC ()
@property (nonatomic, strong) UILabel * label;
@end

@implementation PostPaperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor redColor];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 100, 100)];
        _label.text = @"post paper";
    }
    return _label;
}

@end
