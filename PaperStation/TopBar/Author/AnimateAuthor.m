//
//  AnimateAuthor.m
//  network_AFN
//
//  Created by tybbt on 2018/6/6.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "AnimateAuthor.h"

@interface AnimateAuthor()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *,NSDictionary *> * authorFrameArray;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *,NSDictionary *> * authorCenterArray;
@property (nonatomic, assign) CGRect viewBounds;
@end

@implementation AnimateAuthor

- (instancetype)initWithAnimateViewFrame: (CGRect)bounds
{
    self = [super init];
    if (self) {
        self.viewBounds = bounds;
    }
    return self;
}

- (void)addAuthorCenter: (CGPoint)center atIndex: (NSInteger)key
{
    NSDictionary * author = @{@"centerX":[NSNumber numberWithFloat:center.x],
                              @"centerY":[NSNumber numberWithFloat:center.y]
                              };
    NSNumber * keyPath = [NSNumber numberWithInteger:key];
    [self.authorCenterArray setObject:author forKey:keyPath];
}

- (CGRect)getAuthorCenterAtIndex: (NSInteger)key
{
    NSNumber * keyPath = [NSNumber numberWithFloat:key];
    if (self.authorCenterArray.count <= 0 || ![self.authorCenterArray objectForKey:keyPath]) {
        return CGRectZero;
    }
    
    NSDictionary * dict = [self.authorCenterArray objectForKey:keyPath];
    NSNumber *centerX = [dict objectForKey:@"centerX"];
    NSNumber *centerY = [dict objectForKey:@"centerY"];
    
    CGFloat x = centerX.floatValue - _viewBounds.size.width/2;
    CGFloat y = centerY.floatValue - _viewBounds.size.height/2;
    
    return CGRectMake(x, y, _viewBounds.size.width, _viewBounds.size.height);
}

- (void)addAuthorFrame: (CGRect)frame atIndex: (NSInteger)key
{
    NSDictionary * author = @{@"x":[NSNumber numberWithFloat:frame.origin.x],
                              @"y":[NSNumber numberWithFloat:frame.origin.y],
                              @"width":[NSNumber numberWithFloat:frame.size.width],
                              @"height":[NSNumber numberWithFloat:frame.size.height],
                              };
    NSNumber * keyPath = [NSNumber numberWithInteger:key];
    [self.authorFrameArray setObject:author forKey:keyPath];
}

- (CGRect)getAuthorFrameAtIndex: (NSInteger)key
{
    NSNumber * keyPath = [NSNumber numberWithInteger:key];
    if (self.authorFrameArray.count <= 0 || ![self.authorFrameArray objectForKey:keyPath]) {
        return CGRectZero;
    }
    
    NSDictionary * dict = [self.authorFrameArray objectForKey:keyPath];
    NSNumber * x = [dict objectForKey:@"x"];
    NSNumber * y = [dict objectForKey:@"y"];
    NSNumber * width = [dict objectForKey:@"width"];
    NSNumber * height = [dict objectForKey:@"height"];
    
    CGRect rect = CGRectMake(x.floatValue, y.floatValue, width.floatValue, height.floatValue);
    return rect;
}

- (NSMutableDictionary<NSNumber *,NSDictionary *> *)authorFrameArray
{
    if (!_authorFrameArray) {
        _authorFrameArray = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    return _authorFrameArray;
}

- (NSMutableDictionary<NSNumber *,NSDictionary *> *)authorCenterArray
{
    if (!_authorCenterArray) {
        _authorCenterArray = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    return _authorCenterArray;
}

- (CGRect)viewBounds
{
    if (CGRectIsNull(_viewBounds) || CGRectIsEmpty(_viewBounds) || CGRectIsInfinite(_viewBounds)) {
        return CGRectZero;
    }
    return _viewBounds;
}

@end

