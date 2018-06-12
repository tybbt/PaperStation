//
//  PaperFoldingCell.m
//  network_AFN
//
//  Created by tybbt on 2018/6/3.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "PaperFoldingCell.h"
#import "PaperForeView.h"
#import "PaperContentTitleView.h"
#import "PaperContentView.h"

@interface PaperFoldingCell()
@property (nonatomic, strong) PaperForeView * foreView;
@property (nonatomic, strong) PaperContentTitleView * contentTitleView;
@property (nonatomic, strong) PaperContentView * contentDetailView;
@end

@implementation PaperFoldingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.itemCount = 4;
        self.foregroundView = [self createForegroundView];
        self.containerView = [self createContainerView];
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.foreView.frame = self.foregroundView.bounds;
    self.contentTitleView.frame = CGRectMake(0, 0, CGRectGetWidth(self.containerView.bounds), CGRectGetHeight(self.foregroundView.bounds));
    self.contentDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.contentTitleView.frame), CGRectGetWidth(self.containerView.bounds), CGRectGetHeight(self.containerView.bounds)-CGRectGetHeight(self.foregroundView.bounds));
}

- (HSRotatedView *)createForegroundView{
    HSRotatedView * foregroundView = [[HSRotatedView alloc] initWithFrame:CGRectZero];
    foregroundView.backgroundColor = [UIColor whiteColor];
    foregroundView.translatesAutoresizingMaskIntoConstraints = NO;
    foregroundView.clipsToBounds = YES;
    foregroundView.layer.cornerRadius = 10;
    
    [foregroundView addSubview:self.foreView];
    [self.contentView addSubview:foregroundView];
    
    //layout
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:8];
    self.foregroundViewTop = topConstraint;
    
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:17],
                                       [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-17],
                                       topConstraint
                                       ]
     ];
    
    [foregroundView addConstraint:[NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:165]];
    
    
    [foregroundView layoutIfNeeded];
    
    return foregroundView;
}

- (UIView *)createContainerView{
    UIView * containerView = [[UIView alloc] initWithFrame:CGRectZero];
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    containerView.clipsToBounds = YES;
    containerView.layer.cornerRadius = 10;
    
    [containerView addSubview:self.contentTitleView];
    [containerView addSubview:self.contentDetailView];
    [self.contentView addSubview:containerView];
    
    //layout
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:181];
    self.containerViewTop = topConstraint;
    
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:17],
                                       [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-17],
                                       topConstraint
                                       ]
     ];
    
    [containerView addConstraint:[NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:480]];
    
    
    [containerView layoutIfNeeded];
    
    return containerView;
}

- (NSTimeInterval)animationDuration:(NSInteger)itemIndex type:(AnimationType)type
{
    NSArray * durationList = @[@0.33,@0.26,@0.26];
    return [durationList[itemIndex] doubleValue];
}

- (PaperForeView *)foreView
{
    if (!_foreView) {
        <#statements#>
    }
    return _foreView;
}

- (PaperContentTitleView *)contentTitleView
{
    if (!_contentTitleView) {
        <#statements#>
    }
    return _contentTitleView;
}

- (PaperContentView *)contentDetailView
{
    if (!_contentDetailView) {
        <#statements#>
    }
    return _contentDetailView;
}

@end
