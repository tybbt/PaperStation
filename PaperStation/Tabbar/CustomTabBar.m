//
//  CustomTabBar.m
//  network_AFN
//
//  Created by tybbt on 2018/6/2.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "CustomTabBar.h"
#import "WritePaperVC.h"

@interface CustomTabBar()

@property (nonatomic, strong) UIButton * writePaper;

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.writePaper];
        self.tintColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSMutableArray * tabbarItemArray = [NSMutableArray array];
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarItemArray addObject:view];
        }
    }
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat writeBtnWidth = CGRectGetWidth(self.writePaper.frame);
    CGFloat writeBtnHeight = CGRectGetHeight(self.writePaper.frame);
    
    self.writePaper.center = CGPointMake(barWidth/2, barHeight - writeBtnHeight);
    
    CGFloat barItemWidth = (barWidth - writeBtnWidth)/tabbarItemArray.count;
    [tabbarItemArray enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect frame = view.frame;
        if (idx >= tabbarItemArray.count / 2) {
            frame.origin.x = idx * barItemWidth + writeBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    
    [self bringSubviewToFront:self.writePaper];
}

- (void)clickWritePaperButton
{
    
}

- (UIButton *)writePaper
{
    if (!_writePaper) {
        _writePaper = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
        [_writePaper setImage:[UIImage imageNamed:@"centerIcon"] forState:UIControlStateNormal];
        [_writePaper addTarget:self action:@selector(clickWritePaperButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _writePaper;
}

@end
