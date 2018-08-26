//
//  UserSetCell.m
//  PaperStation
//
//  Created by tybbt on 2018/7/15.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "UserSetCell.h"

@interface UserSetCell()
@property (nonatomic, strong) CALayer * imageLayer;
@property (nonatomic, strong) UITextView * TLabel;
@property (nonatomic, strong) UIView * CellContentView;
@property (nonatomic, strong) CALayer * goBtn;
@end

@implementation UserSetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
