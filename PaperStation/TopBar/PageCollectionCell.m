//
//  PageCollectionCell.m
//  network_AFN
//
//  Created by tybbt on 2018/6/5.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "PageCollectionCell.h"

@interface PageCollectionCell()
@property (nonatomic, strong) UILabel * viewControllerName;
@end

@implementation PageCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setCellView];
    }
    return self;
}

- (void)setCellView
{
    self.backgroundColor = [UIColor clearColor];
    _viewControllerName = [[UILabel alloc] init];
    _viewControllerName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_viewControllerName];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _viewControllerName.frame = CGRectMake(0, 0, 80, 50);
    _viewControllerName.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
}

- (void)setInfo: (NSString *)title
{
    NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc] initWithString:title];
    NSDictionary * attributeStyle = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                      NSForegroundColorAttributeName: [UIColor blackColor]};
    [attrString setAttributes:attributeStyle range:NSMakeRange(0, attrString.length)];
    [self.viewControllerName setAttributedText:attrString];
}


@end
